<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%

//try {
	//String cellVal="'";
	//int val;
	//String un =(String)session.getAttribute("admin");
	//String FileName = request.getParameter("FileName");
	//String ageGrp = request.getParameter("ageGrp");
    //if(un==null){
    //	response.sendRedirect("login.jsp");
    //	}
	
	Connection con=null;
	Statement stmt=null;
	int val,i,j;
	String id="";
	String name="";
	String connectionURL = "jdbc:mysql://localhost:3306/thyrodictor"; 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
	if(!con.isClosed()){
		stmt=con.createStatement();
		ResultSet k= stmt.executeQuery("select count(*) from district;");
		k.next();
		int n=k.getInt(1);
		for(i=1;i<n;i++){
		ResultSet rs = stmt.executeQuery("select district_id, district_name from district;");
		for(j=0;j<i;j++)rs.next();
			id=rs.getString(1);
			name=rs.getString(2);
			val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','Hypothyroidism');");
			val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','Hyperthyroidism');");
			val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','Goiter');");
			val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','Cancer');");
			val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','None');");
		out.print(i);
		}
		/*{
				id=rs.getString(1);
				name=rs.getString(2);
				val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','Hypothyroidism');");
				val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','Hyperthyroidism');");
				val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','Goiter');");
				val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','Cancer');");
				val=stmt.executeUpdate("insert into thyrodictor.graph_table (`district_id`,`district_name`,`thyroid_type`) values ('"+id+"','"+name+"','None');");
			}
		}*/
	}
/*	}
catch(Exception ex){
	out.print("Exception "+ex);
}*/
%>
</body>
</html>