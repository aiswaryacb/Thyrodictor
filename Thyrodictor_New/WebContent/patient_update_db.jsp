<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="0;url=patient_view_details.jsp">
<head>
<%
try{
	
	String un =(String)session.getAttribute("patient");
    if(un==null){response.sendRedirect("login.jsp");}
		
    String name = request.getParameter("pname");
	String dob = request.getParameter("pdob");
	String gender = request.getParameter("pgender");
	String email = request.getParameter("pemail");
	String phone = request.getParameter("pphn");
	//String state = request.getParameter("pstate");
	//String district = request.getParameter("pdistrict");
	//String city = request.getParameter("pcity");
	//String user_id = request.getParameter("puser_id");
	String password = request.getParameter("password");
	String npassword = request.getParameter("npassword");
	String usertype = "patient";
	
	Connection con=null;
	Statement stmt=null;
	
	/* Create string of connection url within specified format with machine name, 
	port number and database name. Here machine name id localhost and 
	database name is usermaster. */ 
	String connectionURL = "jdbc:mysql://localhost:3306/test"; 
	
	// declare a connection by using Connection interface 
	Connection connection = null; 
	
	// Load JBBC driver "com.mysql.jdbc.Driver" 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	
	/* Create a connection by using getConnection() method that takes parameters of 
	string type connection url, user name and password to connect to database. */ 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
   
	
	// check weather connection is established or not by isClosed() method 
	if(!con.isClosed()){
		 stmt=con.createStatement();
//int val =stmt.executeUpdate("INSERT INTO `thyrodictor`.`patient_details` (`patient_id`, `patient_name`, `patient_gender`, `patient_dob`, `patient_email`, `patient_phn`, `patient_city_id`,`patient_photo`) VALUES ('',             `lab_user_id`='"+un+"'                '"+name+"', '"+gender+"', '"+dob+"', '"+email+"', '"+phone+"', '"+city+"','"+photo+"')");
 ResultSet rs=stmt.executeQuery("Select * from patient_details where patient_user_id='"+un+"'");  
		 rs.next();
		 String patient_id = rs.getString(1);
		 String patient_dist=rs.getString(7);
		 String patient_user_id=rs.getString(8);
		 //lab_reg=rs.getString(3);
ResultSet rs1= stmt.executeQuery("select password from login_details where login_id='"+un+"';");
rs1.next();
String pass=rs1.getString(1);
out.print(pass);

if(pass.equals(password)){
int val = stmt.executeUpdate("DELETE FROM `thyrodictor`.`patient_details` WHERE `patient_user_id`='"+un+"';");  
		   
int val1 = stmt.executeUpdate("INSERT INTO `thyrodictor`.`patient_details` (`patient_id`, `patient_name`, `patient_gender`, `patient_dob`, `patient_email`, `patient_phn`, `patient_district_id`, `patient_user_id`) VALUES ('"+patient_id+"', '"+name+"', '"+gender+"', '"+dob+"', '"+email+"', '"+phone+"', '"+patient_dist+"', '"+patient_user_id+"');");
int val2 = stmt.executeUpdate("UPDATE `thyrodictor`.`login_details` SET `password`='"+npassword+"' WHERE `login_id`='"+un+"';");

		      //response.sendRedirect("lab_view_details.jsp");
		      %>
		      <script>alert("Successfully Updated")</script>
		      <%
}
else{
	%>
	<script>alert("Wrong password")</script>
	<%
}
		con.close();	
	}
}
catch(Exception ex){
	out.println("Exception \n\n"+ex);
}
%>
</head>
</body>
</html>