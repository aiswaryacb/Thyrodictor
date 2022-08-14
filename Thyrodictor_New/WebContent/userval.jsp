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
	String usertype = request.getParameter("usertype");
	out.println("usertype ="+usertype);
	String user_id = request.getParameter("user_id");
	//out.println("email ="+email);
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
        	 else if(n.equals("doctor"))
        	 {
        		 ResultSet rs1=stmt.executeQuery("Select doctor_status from doctor_details where doctor_user_id='"+user_id+"'"); 
        		 rs1.next();
        		 if(rs1.getString(1).equals("accepted")){
        			 session.setAttribute("doctor",user_id);
	        		 response.sendRedirect("doctor_home.jsp?status=ok");
	        		 
	               //  session.getAttribute("user");
        		 }else if(rs1.getString(1).equals("denied")){
        			 session.setAttribute("doctor",user_id);
	        		 response.sendRedirect("login.jsp?status=denied");
        		 }else{
        			 response.sendRedirect("login.jsp?status=true");
        		 }
        	 }
        	 else if(n.equals("lab"))
        	 {
        		 ResultSet rs2=stmt.executeQuery("Select lab_status from lab_details where lab_user_id='"+user_id+"'"); 
        		 rs2.next();
        		 if(rs2.getString(1).equals("accepted")){
	        		 session.setAttribute("lab",user_id);
	        		 response.sendRedirect("lab_home.jsp");
        		 }else if(rs2.getString(1).equals("denied")){
	        		 session.setAttribute("lab",user_id);
	        		 response.sendRedirect("login.jsp?status=denied");
        		 }else{
        			 response.sendRedirect("login.jsp?status=true");
        		 }
        		 
                 //session.getAttribute("user");        
             }
        	 else if(n.equals("admin"))
        	 {
        		 session.setAttribute("admin",user_id);
        		 response.sendRedirect("admin_home.jsp");
        		 
                 //session.getAttribute("user");        
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