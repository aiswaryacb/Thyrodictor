
<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<meta http-equiv="Refresh" content="0;url=login.jsp?status=">
<html>
<head>
<%
//try {

String user_id = request.getParameter("user_id");
System.out.println(user_id);
String to = request.getParameter("email");
String password=null;
String name="";
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
	if(!con.isClosed()){
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select * from login_details where login_id='"+user_id+"'");
		if(rs.next()){
			password=rs.getString(3);
			String user_type=rs.getString(2);
			if(user_type.equals("patient")){
			ResultSet rs2=stmt.executeQuery("Select * from patient_details where patient_user_id='"+user_id+"';");
			rs2.next();
			name=rs2.getString(2);
			}
			else if(user_type.equals("doctor")){
				ResultSet rs2=stmt.executeQuery("Select * from doctor_details where doctor_user_id='"+user_id+"';");
				rs2.next();
				name=rs2.getString(3);
			}
			else if(user_type.equals("lab")){
				ResultSet rs2=stmt.executeQuery("Select * from lab_details where lab_user_id='"+user_id+"';");
				rs2.next();
				name=rs2.getString(2);
			}

    //Creating a result for getting status that messsage is delivered or not!

    String result="";

    // Get recipient's email-ID, message & subject-line from index.html page

    //final String to = request.getParameter("mail");

    //final String subject = request.getParameter("sub");

    //final String messg = request.getParameter("mess");

 

    // Sender's email ID and password needs to be mentioned

    final String from = "csmainproject14@gmail.com";

    final String pass = "adminprinci";

 

    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

    props.setProperty("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");
    //props.setProperty("mail.transport.protocol", "smtp");
       // props.setProperty("mail.host", "smtp.gmail.com");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);
//out.println("answer="+from);
    props.put("mail.password", pass);

    props.put("mail.port", "465");

 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() 
    {

        

        protected PasswordAuthentication getPasswordAuthentication() 
        {

            return new PasswordAuthentication(from, pass);

        }

    });

 

   

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

        message.setText("Hello "+name+" !!\n\nYour password is "+password+"\nPlease note it down. Dont reply this mail... \n\nHave a nice day :)\n\nThank You ");

        // Send message

        Transport.send(message);

        result = "Your mail sent successfully....";
        %>
        <script>alert("Your password has been mailed to the registered mail id.");</script>
        <%
       // response.sendRedirect("login.jsp");
        
    }
		
	else{
		%>
		<script>alert("User does not exist!!!");</script>
		<%
		//response.sendRedirect("login.jsp");
	}
	}
    //} catch (MessagingException mex) {

       // mex.printStackTrace();

        //result = "Error: unable to send mail....";
        %>
      <!--    <script>alert("unable to send mail....");</script>-->
        <%
        //response.sendRedirect("login.jsp");

  //  }


//response.sendRedirect("login.jsp");
%>
</head>
</html>
