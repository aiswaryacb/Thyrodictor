<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<%
String to = request.getParameter("email");
String password=null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
	if(!con.isClosed()){
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select * from login_details where login_id='"+to+"'");
		if(rs.next()){
			password=rs.getString(3);
		}
		else{
			%>
			<script>alert("User does not exist!!!");</script>
			<%
			response.sendRedirect("login.jsp");
		}
	}
   String result;
   out.println("Helloo"+password);
   // Recipient's email ID needs to be mentioned.
   

   // Sender's email ID needs to be mentioned
   String from = "csmainproject14@gmail.com";

   // Assuming you are sending email from localhost
   String host = "localhost";
   
// Get system properties object
   Properties properties = System.getProperties();

   // Setup mail server
   
   properties.setProperty("mail.smtp.host", host);

   // Get the default Session object.
   Session mailSession = Session.getDefaultInstance(properties);
	try{
		//Properties properties = new Properties();
        //properties.put("mail.smtp.host", host);
        //properties.put("mail.smtp.port", port);
        //properties.put("mail.smtp.auth", "true");
        //properties.put("mail.smtp.starttls.enable", "true");
 
   
  

      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);
      
      // Set From: header field of the header.
      message.setFrom(new InternetAddress(from));
      
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // Set Subject: header field
      message.setSubject("Thyrodictor - Forgot Password");
      
      // Now set the actual message
      message.setText("Hello user! \n Your password is "+password);
      
      // Send message
      Transport.send(message);
      result = "Sent message successfully....";
      %>
      <script>alert("Your password has been mailed to the registered mail id.");</script>
      <%
      response.sendRedirect("login.jsp");
   } catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
%>
</head>
</html>