<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="0;url=lab_view_details.jsp">
<title>Insert title here</title>
<%
try{
	
	String un =(String)session.getAttribute("lab");
    if(un==null){response.sendRedirect("login.jsp");}
		
	String name = request.getParameter("ulname");
	//String reg = request.getParameter("lreg");
	//String gender = request.getParameter("dgender");
	String email = request.getParameter("ulemail");
	String phone = request.getParameter("ulphn");
	//String state = request.getParameter("lstate");
	//String district = request.getParameter("ldistrict");
	//String city = request.getParameter("lcity");
	//String photo = request.getParameter("lphoto");
	String password = request.getParameter("password");
	String npassword = request.getParameter("npassword");
	String time_from =request.getParameter("utime_from");
	String time_to = request.getParameter("utime_to");
	//String user_id = request.getParameter("luser_id");
	//String usertype = "lab";
	
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
 ResultSet rs=stmt.executeQuery("Select * from lab_details where lab_user_id='"+un+"'");  
		 rs.next();
		 String lab_id;
		 String lab_reg;
		 String lab_district;
		 String lab_userid;
		 String lab_status;
		// String labid=rs.getString(1);
		 lab_id=rs.getString(1);	
		 lab_reg=rs.getString(3);
		 lab_district=rs.getString(4);	
		 lab_userid=rs.getString(9);
		 lab_status=rs.getString(10);	
		 out.println(lab_id);
		 //lab_reg=rs.getString(3);
ResultSet rs1=stmt.executeQuery("select password from login_details where login_id='"+un+"';");
rs1.next();
String pass=rs1.getString(1);
if(pass.equals(password)){
int val = stmt.executeUpdate("DELETE FROM `thyrodictor`.`lab_details` WHERE `lab_user_id`='"+un+"';");  
		   
int val1 = stmt.executeUpdate("INSERT INTO `thyrodictor`.`lab_details` (`lab_id`, `lab_name`, `lab_reg`, `lab_district`, `lab_time_from`, `lab_time_to`, `lab_phn`, `lab_email`, `lab_user_id`, `lab_status`) VALUES ('"+lab_id+"', '"+name+"', '"+lab_reg+"', '"+lab_district+"', '"+time_from+"', '"+time_to+"', '"+phone+"', '"+email+"', '"+lab_userid+"', '"+lab_status+"');");
// int val1 = stmt.executeUpdate("INSERT INTO `thyrodictor`.`login_details` (`login_id`, `user_type`, `password`) VALUES ('"+user_id+"', '"+usertype+"', '"+password+"');");
		    //if(val==1 && val1==1)
		      //response.sendRedirect("lab_view_details.jsp");
		    int val2 = stmt.executeUpdate("UPDATE `thyrodictor`.`login_details` SET `password`='"+npassword+"' WHERE `login_id`='"+un+"';");

%>
<script>alert("Updated Successfully")</script>
<%
}
else{
	%>
	<script>alert("Wrong Password!")</script>
	<%
}
		con.close();	
	}
}
catch(Exception ex){
	out.println("Exception \n\n"+ex);
}
%>

</body>
</html>