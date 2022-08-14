<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
 <%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Refresh" content="0;url=#">

<head>


<% 
try {
	String un =(String)session.getAttribute("patient");
 
	
    if(un==null){
    	response.sendRedirect("login.jsp");
    	}
	String status = request.getParameter("status");
	String msgid = request.getParameter("msgid");
		
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
		 if(status.equals("receiver")){
		    int val = stmt.executeUpdate("update messages set message_receiver_status='deleted' where message_id='"+msgid+"';");
		    if(val==1){
		        %>
		        <script>alert("Message deleted!");</script>
		        <%}
		    else{
		    	%>
	        <script>alert("Error deleting message");</script>
	        <%}
		 int val1= stmt.executeUpdate("delete from messages where message_receiver_status='deleted' and message_sender_status='deleted';");
		con.close();
		response.sendRedirect("patient_messages.jsp");
		 }
		 else{
			 int val = stmt.executeUpdate("update messages set message_sender_status='deleted' where message_id='"+msgid+"';");
			    if(val==1){
			        %>
			        <script>alert("Message deleted!");</script>
			        <%}
			    else{
			    	%>
		        <script>alert("Error deleting message");</script>
		        <%}
				 int val1= stmt.executeUpdate("delete from messages where message_receiver_status='deleted' and message_sender_status='deleted';");
			con.close();
			response.sendRedirect("patient_sent_messages.jsp");
		 }
	}
}
catch(Exception ex){
	out.println("Exception \n\n"+ex);
}
%>

</head>
</html>