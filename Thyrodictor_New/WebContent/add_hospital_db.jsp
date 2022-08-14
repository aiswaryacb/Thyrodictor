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
try {
	String un =(String)session.getAttribute("doctor");
    if(un==""){response.sendRedirect("login.jsp");}
	
	
	String[] days; 
	String name = request.getParameter("hname");
	//String dob = request.getParameter("pdob");
	//String gender = request.getParameter("pgender");
	//String email = request.getParameter("pemail");
	String reg = request.getParameter("hreg");
	String time_from =request.getParameter("time_from");
	String time_to = request.getParameter("time_to");
	String phone = request.getParameter("hphn");
	days= request.getParameterValues("days");
	String state = request.getParameter("hstate");
	String district = request.getParameter("hdistrict");
	//String city = request.getParameter("pcity");
	//String photo = request.getParameter("pphoto");
	//String password = request.getParameter("hpassword");
	//String doctorid = "1";
	 
              		            	  
	String usertype = "doctor";
	for(int i=0;i<days.length;i++)
	{
		out.println("<b>"+days[i]+"<b>");
	}
	
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
		 String doc_id="";
			
         ResultSet rs = stmt.executeQuery("select * from doctor_details where doctor_user_id='"+un+"';");
         
         if(rs.next()){
       	  doc_id=rs.getString(1);
         }

		 
		 
		 
		 
		   //int val =stmt.executeUpdate("INSERT INTO `thyrodictor`.`patient_details` (`patient_id`, `patient_name`, `patient_gender`, `patient_dob`, `patient_email`, `patient_phn`, `patient_city_id`,`patient_photo`) VALUES ('', '"+name+"', '"+gender+"', '"+dob+"', '"+email+"', '"+phone+"', '"+city+"','"+photo+"')");
		   int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`hospital_details` (`doctor_id`,`hospital_name`, `hospital_district`, `hospital_time_from`, `hospital_time_to`, `hospital_days`, `hospital_phn`) VALUES ('"+doc_id+"','"+name+"', '"+district+"', '"+time_from+"', '"+time_to+"', '"+days+"', '"+phone+"');");
		    //int val1 = stmt.executeUpdate("INSERT INTO `thyrodictor`.`login_details` (`login_id`, `user_type`, `password`) VALUES ('"+email+"', '"+usertype+"', '"+password+"');");
		    //if(val==1)
		    	response.sendRedirect("doctor_home.jsp");
		   // else
		   //   response.sendRedirect("login.jsp");
			
		con.close();	
	}
}
catch(Exception ex){
	out.println("Exception \n\n"+ex);
}
%>

</body>
</html>