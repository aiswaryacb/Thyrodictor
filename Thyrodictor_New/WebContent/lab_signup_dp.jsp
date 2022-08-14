<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="0;url=signup.jsp">
<title>Insert title here</title>
</head>
<body>

<% 
try {
	
	String name = request.getParameter("lname");
	String reg = request.getParameter("lreg");
	//String gender = request.getParameter("dgender");
	String email = request.getParameter("lemail");
	String phone = request.getParameter("lphn");
	String state = request.getParameter("lstate");
	String district = request.getParameter("ldistrict");
	String city = request.getParameter("lcity");
	//String photo = request.getParameter("lphoto");
	String password = request.getParameter("lpassword");
	String time_from =request.getParameter("time_from");
	String time_to = request.getParameter("time_to");
	String user_id = request.getParameter("luser_id");
	String usertype = "lab";
	
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
		 int count=0;
		 ResultSet rs=stmt.executeQuery("Select count(*) from lab_details where lab_user_id='"+user_id+"'"); 
		 //String c="Select count(*) from patient_details where patient_user_id='"+user_id+"'";
		 
		 //if(c.equals(0)){
			 if(rs.next())
			 {
				count=rs.getInt(1); 
			 }
			 if(count==0){
		   //int val =//stmt.executeUpdate("INSERT INTO `thyrodictor`.`patient_details` (`patient_id`, `patient_name`, `patient_gender`, `patient_dob`, `patient_email`, `patient_phn`, `patient_city_id`,`patient_photo`) VALUES ('', '"+name+"', '"+gender+"', '"+dob+"', '"+email+"', '"+phone+"', '"+city+"','"+photo+"')");
		    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`lab_details` (`lab_name`, `lab_reg`, `lab_district`, `lab_time_from`, `lab_time_to`, `lab_phn`, `lab_email`,`lab_user_id`) VALUES ('"+name+"', '"+reg+"', '"+district+"', '"+time_from+"', '"+time_to+"', '"+phone+"', '"+email+"', '"+user_id+"');");
		    int val1 = stmt.executeUpdate("INSERT INTO `thyrodictor`.`login_details` (`login_id`, `user_type`, `password`) VALUES ('"+user_id+"', '"+usertype+"', '"+password+"');");
		    //if(val==1 && val1==1)
		        response.sendRedirect("login.jsp?status=true");
		  //  else
		    //    response.sendRedirect("signup.jsp");
			 }
			 else
			 {
				 %>
				    <script>
				        alert("Email ID already exixts. Choose another Email ID");
				        //response.sendRedirect(signup.jsp);
				    </script>
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