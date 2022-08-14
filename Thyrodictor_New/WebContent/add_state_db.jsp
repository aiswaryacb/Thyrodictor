<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="0;url=admin_home.jsp">
<title>Insert title here</title>
</head>
<body>


<% 
try {
	
	String state = request.getParameter("state");
	String district = request.getParameter("district");
	
	
	Connection con=null;
	Statement stmt=null;
	
	/* Create string of connection url within specified format with machine name, 
	port number and database name. Here machine name id localhost and 
	database name is usermaster. */ 
	String connectionURL = "jdbc:mysql://localhost:3306/test"; 
	
	// declare a connection by using Connection interface 
	//Connection connection = null; 
	
	// Load JBBC driver "com.mysql.jdbc.Driver" 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	
	/* Create a connection by using getConnection() method that takes parameters of 
	string type connection url, user name and password to connect to database. */ 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
   
	
	// check weather connection is established or not by isClosed() method 
	if(!con.isClosed()){
		 stmt=con.createStatement();
		   //int val =//stmt.executeUpdate("INSERT INTO `thyrodictor`.`patient_details` (`patient_id`, `patient_name`, `patient_gender`, `patient_dob`, `patient_email`, `patient_phn`, `patient_city_id`,`patient_photo`) VALUES ('', '"+name+"', '"+gender+"', '"+dob+"', '"+email+"', '"+phone+"', '"+city+"','"+photo+"')");
		    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`state` (`state_name`) VALUES ('"+state+"');");
		    //int val1 = stmt.executeUpdate("INSERT INTO `thyrodictor`.`district` (`district_id`, ``, `password`) VALUES ('"+email+"', '"+usertype+"', '"+password+"');");
		    //if(val==1 && val1==1)
		        //response.sendRedirect("add_district.jsp");
		  //  else
		    //    response.sendRedirect("signup.jsp");
			
		con.close();	
	}
}
catch(Exception ex){
	out.println("Exception \n\n"+ex);
}
%>
<script>alert("State added succesfully");</script>


</body>
</html>