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
try{
	
	String user_id = request.getParameter("user_id");
	
	String pw = request.getParameter("password");
	out.println("pw ="+pw);
	Connection con=null;
	Statement stmt=null;
	String connectionURL= "jdbc:mysql://localhost:3306/test"; 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
	if(!con.isClosed()){
		stmt=con.createStatement();
		 //stmt=con.createStatement();
		
		 //ResultSet rs = stmt.executeQuery("SELECT * FROM `thyrodictor`.`login_details` WHERE `login_id` = '"+email+"' AND `password`='"+pw+"';");
         //ResultSet rs=stmt.executeQuery("SELECT * FROM thyrodictor.login_details WHERE login_id='"+email+"' AND password='"+pw+"';");
		 ResultSet rs=stmt.executeQuery("Select * from login_details where login_id='"+user_id+"' and password='"+pw+"'");  
		 String n;
         
         if(rs.next())
         {
        	 n=rs.getString(2);
             out.println("n= "+n);
        	 out.println("HELLOO");
        	 //response.sendRedirect("patient_home.jsp");
        	 
        	 if(n.equals("patient"))
        	 {
             response.sendRedirect("patient_home.jsp");
             session.setAttribute("patient",user_id);
             //session.getAttribute("user");
        	 }
        	 else if(n.equals("doctor")){
        		 response.sendRedirect("login.jsp?status=er");
        	 }
        	 else if(n.equals("lab")){
        		 response.sendRedirect("login.jsp?status=er");
        	 }
        	 else if(n.equals("admin")){
        		 response.sendRedirect("login.jsp?status=er");
        	 }
        	 
         }
         else
         {
             response.sendRedirect("login.jsp?status=er");
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