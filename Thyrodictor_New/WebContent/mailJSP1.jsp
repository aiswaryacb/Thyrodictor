<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>
    
    <% 
String result;

    // Get recipient's email-ID, message & subject-line from index.html page
    String smtpHost = "smtp.mail.yahoo.com";
    String popHost = "pop.mail.yahoo.com";

    final String to = request.getParameter("mail");

    final String subject = request.getParameter("sub");

    final String messg = request.getParameter("mess");

 

    // Sender's email ID and password needs to be mentioned

    final String from = "thyrodictor14@yahoo.com";

    final String pass = "adminprinci";
    
 // Get system properties
    Properties props = System.getProperties();

    // Setup mail server
    props.put("mail.smtp.host", smtpHost);

    // Get session
    Session session1 = Session.getDefaultInstance(props, null);
    session1.setDebug(true);

    // Pop Authenticate yourself
    Store store = session1.getStore("pop3");
    store.connect(popHost, from, pass);

    // Define message
    MimeMessage message = new MimeMessage(session1);
    message.setFrom(new InternetAddress(from));
    message.addRecipient(Message.RecipientType.TO, 
      new InternetAddress(to));
    message.setSubject(subject);
    message.setText(messg);

    // Send message
    Transport.send(message);

    
    
    %>