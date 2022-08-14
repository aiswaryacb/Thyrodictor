<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
 <%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Refresh" content="0;url=patient_search_doctors.jsp?name=">

<head>


<% 
try {
	String un =(String)session.getAttribute("patient");
 
	
    if(un==null){
    	response.sendRedirect("login.jsp");
    	}
	String doc= request.getParameter("doc");
	String rate = request.getParameter("input-1");
		
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
		 //out.print(doc);
		 ResultSet rs=stmt.executeQuery("select doctor_rating,doctor_n_rates from doctor_details where doctor_id='"+doc+"';");
		 
		if(rs.next()){
		 float rating=rs.getFloat(1);
		 int nrates=rs.getInt(2);
		 nrates++;
		 rating=rating+Float.parseFloat(rate);
		 int v=stmt.executeUpdate("UPDATE `thyrodictor`.`doctor_details` SET `doctor_rating`='"+rating+"', `doctor_n_rates`='"+nrates+"' WHERE `doctor_id`='"+doc+"';");
		 %>
		 <script>alert("Rated successfully!");</script>
		 <%
		 //response.sendRedirect("patient_search_doctors.jsp");
		}
		else{
			%>
			<script>alert("Error rating!");</script>
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
</html>