<%@page import="com.sun.org.apache.regexp.internal.RESyntaxException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
 <%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
        <%
try{
	
	String un =(String)session.getAttribute("patient");
 	String msgid = request.getParameter("msgid");
	
    if(un==null){
    	response.sendRedirect("login.jsp");
    	}
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
		 ResultSet rs=stmt.executeQuery("Select * from patient_details where patient_user_id='"+un+"'");  
		 if(rs.next())
		 {
		 String name;
		 name=rs.getString(2);
		 
		 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  	<script language="Javascript" type="text/javascript">
  	function validate(){
    	var email=document.mail.email.value;
    	var subject=document.mail.subject.value;
    	var body=document.mail.body.value;

if(email==""|| email==null){

fontcolor="red";
document.getElementById('error').innerHTML= "<span style=\"color:red\">Receiver address is required</span>";

return false;
}
//for(int i=0;i<email.length;i++)
//{
//while(email.charAt(i)!='@')
	//{
	//fontcolor="red";
	//document.getElementById('perror5').innerHTML= "<span style=\"color:red\">Enter a valid email id </span>";
	
	//return false;
	//}
//}
if(subject==""|| subject==null){

fontcolor="red";
document.getElementById('error1').innerHTML= "<span style=\"color:red\">Subject is required</span>";

return false;
}
else if(subject.length>100){
fontcolor="red";
document.getElementById('error1').innerHTML= "<span style=\"color:red\">Subject can have only 100 characters</span>";
//alert("minnn");
return false;
}
if(body==""|| body==null){

fontcolor="red";
document.getElementById('error2').innerHTML= "<span style=\"color:red\">Message is required</span>";

return false;
}
else if(body.lenght>1000)
{
fontcolor="red";
document.getElementById('error2').innerHTML= "<span style=\"color:red\">Message can have only 1000 characters</span>";

return false;
}
else{
return true;
}
}
  	function msgDelete2()
    {
    	document.getElementById('error2').innerHTML= "";
    }
  	function msgDelete()
    {
    	document.getElementById('error').innerHTML= "";
    }
  	function msgDelete1()
    {
    	document.getElementById('error1').innerHTML= "";
    }
  	</script>
  	  
    <!--=============================================== 
    Template Design By WpFreeware Team.
    Author URI : http://www.wpfreeware.com/
    ====================================================-->

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <title>Thyrodictor : Patient</title>

    <!-- Mobile Specific Metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/icon" href="images/favicon.ico"/>

    <!-- CSS
    ================================================== -->       
    <!-- Bootstrap css file-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Font awesome css file-->
    <link href="css/font-awesome.min.css" rel="stylesheet">       
    <!-- Default Theme css file -->
    <link id="switcher" href="css/themes/default-theme.css" rel="stylesheet">    
    <!-- Slick slider css file -->
    <link href="css/slick.css" rel="stylesheet"> 

    <!-- Main structure css file -->
    <link href="style.css" rel="stylesheet">
   
    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>  
    <link href='http://fonts.googleapis.com/css?family=Habibi' rel='stylesheet' type='text/css'>      
    <link href='http://fonts.googleapis.com/css?family=Cinzel+Decorative:900' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]--> 
  </head>
  <body>    
  
  
  
    <!-- BEGAIN PRELOADER -->
    <div id="preloader">
      <div id="status">&nbsp;</div>
    </div>
    <!-- END PRELOADER -->

    <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-heartbeat"></i></a>
    <!-- END SCROLL TOP BUTTON -->

   <!--=========== BEGIN HEADER SECTION ================-->
    <header id="header">
      <!-- BEGIN MENU -->
      <div class="menu_area">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">  
          <div class="container">
            <div class="navbar-header">
              <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

              <!-- LOGO -->              
              <!-- TEXT BASED LOGO -->
              <a class="navbar-brand" href="index.html"><i class="fa fa-heartbeat"></i><span>Thyrodictor</span></a>              
              <!-- IMG BASED LOGO  -->
              <!--  <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>   -->     
                     
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul id="top-menu" class="nav navbar-nav navbar-right main-nav">
                <li><a href="patient_home.jsp"><span class="glyphicon glyphicon-home"></span></a></li><li></li>
                <li><a href="patient_messages.jsp?msg="><span class="glyphicon glyphicon-envelope"></span></a></li><li></li>
                 <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-triangle-bottom"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="patient_view_details.jsp"><%=name %></a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                  </ul>
                </li>
                
              </ul>           
            </div><!--/.nav-collapse -->
          </div>     
        </nav>  
      </div>
      <!-- END MENU -->    
    </header>
    <!--=========== END HEADER SECTION ================-->      

    
    
    
     
    <section id="blogArchive">      
      <div class="row">
        <div class="col-lg-12 col-md-12">
          <div class="blog-breadcrumbs-area">
            <div class="container">
              <div class="blog-breadcrumbs-left">
                <h2>Welcome <%=name %>!</h2>
              </div>
              <div class="blog-breadcrumbs-right">
                <ol class="breadcrumb">
                  <li>You are here</li>                
                  <li><a href="patient_home.jsp">Patient Home</a></li>
                  <li><a href="patient_messages.jsp">Messages</a></li>
                  <li class="active">View Message</li>
                </ol>
              </div>
            </div>
          </div>
        </div>        
      </div> 
     </section>

                	  <!-- =======Home Sectionn======= -->
               	  
    <section id="service">
      <div class="container">
         <div class="col-lg-4 col-md-4">
			<div class="row">
				<div class="readmore_area" align="right">
					<a data-toggle="modal" data-target="#myModal" href="#" data-hover="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Compose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Compose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
				</div>
				              <!-- start modal window -->
              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="myModalLabel">Compose</h4>
                    </div>
                    <div class="modal-body">
                      <div class="appointment-area">
                        <form class="appointment-form"  id="mail" name="mail" method="post" action="patient_send_mail.jsp"  onsubmit="return validate();">
                        
                        	<div class="row">
                             <div class="col-md-4 col-sm-4">
                              <label for="email" class="control-label">To: <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-8 col-sm-8">
                              <input type="text" id="email" name="email" class="wp-form-control wpcf7-email" placeholder="Reciever address" onchange="return msgDelete();">
                              <p id="error"></p>  
                            </div>
                            </div> 
                            
                            <div class="row">
                             <div class="col-md-4 col-sm-4">
                              <label for="subject" class="control-label">Subject: <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-8 col-sm-8">
                              <input type="text" id="subject" name="subject" class="wp-form-control wpcf7-email" placeholder="Subject" onchange="return msgDelete1();">
                              <p id="error1"></p>  
                            </div>
                            </div> 
                            
                            <div class="row">
                             <div class="col-md-4 col-sm-4">
                              <label for="body" class="control-label">Message: <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-8 col-sm-8">
                              <textarea id="body" name="body" class="wp-form-control wpcf7-email" placeholder="type your message here...." onchange="return msgDelete2();"></textarea>
                              <p id="error2"></p>
                              <!-- input type="text" id="body" name="body" class="wp-form-control wpcf7-email" placeholder="type your message here...."-->  
                            </div>
                            </div> 
                                                                    
                          <div class="row">
                          <div class="col-md-2 col-sm-2"></div>             
                             
                          <!-- input type="text" class="wp-form-control wpcf7-text" placeholder="Subject">
                          <textarea class="wp-form-control wpcf7-textarea" cols="30" rows="10" placeholder="What would you like to tell us"></textarea!-->
                         <div class="col-md-8 col-sm-8">
                         <button class="wpcf7-submit button--itzel" type="submit"><i class="button__icon fa fa-share"></i><span>Send</span></button>  
                         </div>
                         <div class="col-md-2 col-sm-2"></div>
                         </div>
                        </form>
                      </div>
                    </div>       
                      
                            
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div><!-- /.modal -->
			</div>
			<div class="row">
				<div class="readmore_area" align="right">
					<a href="patient_sent_messages.jsp" data-hover="Sent Messages"><span>Sent Messages</span></a>    
				</div>
			</div>
         </div>
         <div class="col-lg-8 col-md-8">
         <%
         int val=stmt.executeUpdate("update messages set message_receiver_status='read' where message_id='"+msgid+"';"); 
         ResultSet rs1 = stmt.executeQuery("select * from messages where message_id='"+msgid+"';");
         rs1.next();
        	 %>
			<div class="row">
			<div class="col-lg-3 col-md-3">
			<h5><b>From : </b></h5>
			</div>
			<div class="col-lg-9 col-md-9">
			<a href="patient_view_sender.jsp?userid=<%=rs1.getString(2) %>"><h5><%=rs1.getString(2) %></h5></a>
			</div>
			</div>
			
			<div class="row">
			<div class="col-lg-3 col-md-3">
			<h5><b>Subject : </b></h5>
			</div>
			<div class="col-lg-9 col-md-9">
			<h5><%=rs1.getString(4) %></h5>
			</div>
			</div>
			
			<div class="row">
			<div class="col-lg-3 col-md-3">
			<h5><b>Message : </b></h5>
			</div>
			<div class="col-lg-9 col-md-9">
			<h5><%=rs1.getString(5) %></h5>
			</div>
			</div>
         </div>
      </div>
    </section>
    
    
    				<!-- =========End Home Section========= -->
              
              
                  <!--=========== Start Footer SECTION ================-->
    <footer id="footer">
      <!-- Start Footer Top -->
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4">
              <div class="single-footer-widget">
                <div class="section-heading">
                <h2>About Us</h2>
                <div class="line"></div>
              </div>           
              <p>Thyrodictor is project developed by 4 final year B.Tech Students.<br>Thyrodictor is an efficient thyroid disease detector and predictor. From various symptoms thyrodector analyses ones thyroid condition. Different blood test reports are analysed to detect thyroid disorders.</p>
              <p>Thyrodictor analyses the thyroid conditions of different patients in the same locality to present an area analysis. It also help you to connect a thyroid doctor near you.</p>
              </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4">
              <div class="single-footer-widget">
                <div class="section-heading">
                <h2>Our Service</h2>
                <div class="line"></div>
              </div>
              <ul class="footer-service">
                <li><span class="fa fa-check"></span>Thyroid disorder detection</li>
                <li><span class="fa fa-check"></span>Thyroid disorder prediction</li>
                <li><span class="fa fa-check"></span>Connect patients to doctors</li>
                <li><span class="fa fa-check"></span>Connect patients and laboratories</li>
                <!-- li><span class="fa fa-check"></span>Service 5</li-->
              </ul>
              </div>
            </div>
            <!-- div class="col-lg-3 col-md-3 col-sm-3">
              <div class="single-footer-widget">
                <div class="section-heading">
                <h2>Tags</h2>
                <div class="line"></div>
              </div>
                <ul class="tag-nav">
                  <li><a href="#">Dental</a></li>
                  <li><a href="#">Surgery</a></li>
                  <li><a href="#">Pediatric</a></li>
                  <li><a href="#">Cardiac</a></li>
                  <li><a href="#">Ophthalmology</a></li>
                  <li><a href="#">Diabetes</a></li>
                </ul>
              </div>
            </div-->
            <div class="col-lg-4 col-md-4 col-sm-4">
              <div class="single-footer-widget">
                <div class="section-heading">
                <h2>Contact Info</h2>
                <div class="line"></div>
              </div>
              <p>Dept. of Computer Science and Engineering, College Of Engineering, Kidangoor</p>
              <address class="contact-info">
                <p><span class="fa fa-home"></span>Group-14</p>
                <p><span class="fa fa-phone"></span>9876543210</p>
                <p><span class="fa fa-envelope"></span>csmainproject14@gmail.com</p>
              </address>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Start Footer Middle -->
      <div class="footer-middle">
        <div class="container">
          <div class="row">
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="footer-copyright">
              <p>&copy; Copyright 2018 <a href="#">Thyrodictor</a></p>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <!-- div class="footer-social">              
                <a href="#"><span class="fa fa-facebook"></span></a>
                <a href="#"><span class="fa fa-twitter"></span></a>
                <a href="#"><span class="fa fa-google-plus"></span></a>
                <a href="#"><span class="fa fa-linkedin"></span></a>     
            </div-->
          </div>
        </div>
        </div>
      </div>
      <!-- Start Footer Bottom -->
      <div class="footer-bottom">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <p>Design & Developed By <!-- a rel="nofollow" href="http://www.wpfreeware.com/">WpF Freeware<!/a-->CS Main Project - Group 14</p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!--=========== End Footer SECTION ================-->

    <!-- jQuery Library  -->
    <script src="js/jquery.js"></script>    
    <!-- Bootstrap default js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- slick slider -->
    <script src="js/slick.min.js"></script>    
    <script type="text/javascript" src="js/modernizr.custom.79639.js"></script>      
    <!-- counter -->
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <!-- Doctors hover effect -->
    <script src="js/snap.svg-min.js"></script>
    <script src="js/hovers.js"></script>
    
    <!-- Custom JS -->
    <script src="js/custom.js"></script>
  
  </body>
</html>
   
    	 <%
		 }
	}
         		 con.close();	
}
catch(Exception ex){
	out.println("Exception \n\n"+ex );
}

%>