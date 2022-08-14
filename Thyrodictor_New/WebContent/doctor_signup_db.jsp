<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="5;url=signup.jsp">
<title>Insert title here</title>
</head>
<body>

<% 
try {
	
	String name = request.getParameter("dname");
	String reg = request.getParameter("dreg");
	String gender = request.getParameter("dgender");
	String email = request.getParameter("demail");
	String phone = request.getParameter("dphn");
	String state = request.getParameter("dstate");
	String district = request.getParameter("ddistrict");
	String city = request.getParameter("dcity");
	//String photo = request.getParameter("dphoto");
	String password = request.getParameter("dpassword");
	String user_id= request.getParameter("duser_id");
	String usertype = "doctor";
	
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
		 ResultSet rs=stmt.executeQuery("Select count(*) from doctor_details where doctor_user_id='"+user_id+"'"); 
		 //String c="Select count(*) from patient_details where patient_user_id='"+user_id+"'";
		 
		 //if(c.equals(0)){
			 if(rs.next())
			 {
				count=rs.getInt(1); 
			 }
			 if(count==0){
		   //int val =//stmt.executeUpdate("INSERT INTO `thyrodictor`.`patient_details` (`patient_id`, `patient_name`, `patient_gender`, `patient_dob`, `patient_email`, `patient_phn`, `patient_city_id`,`patient_photo`) VALUES ('', '"+name+"', '"+gender+"', '"+dob+"', '"+email+"', '"+phone+"', '"+city+"','"+photo+"')");
		    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`doctor_details` (`doctor_reg`, `doctor_name`, `doctor_email`, `doctor_phn`, `doctor_gender`, `doctor_user_id`) VALUES ('"+reg+"', '"+name+"', '"+email+"', '"+phone+"', '"+gender+"','"+user_id+"');");
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
				        alert("User ID already exixts. Choose another User ID");
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