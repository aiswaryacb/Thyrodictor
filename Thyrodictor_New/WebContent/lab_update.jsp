<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
      <script language="Javascript" type="text/javascript">
      function onlyNumbers2(e, t) {
          try {
          	document.getElementById('ulerror66').innerHTML= "";
          	 if (window.event) {
                  var charCode = window.event.keyCode;
              }
              else if (e) {
                  var charCode = e.which;
              }
              else { return true; }
              if ((charCode >= 48 && charCode <= 57))
                  return true;
              else
                  return false;
          }
          catch (err) {
              alert(err.Description);
          }
      }
      
      
      function onlyAlphabets2(e, t) {
          try {
          	document.getElementById('ulerror').innerHTML= "";
              if (window.event) {
                  var charCode = window.event.keyCode;
              }
              else if (e) {
                  var charCode = e.which;
              }
              else { return true; }
              if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123)|| (charCode==32))
                  return true;
              else
                  return false;
          }
          catch (err) {
              alert(err.Description);
          }
      }
      function msgDelete(){
    	  document.getElementById('error').innerHTML= "";
      }
      function msgDelete1(){
    	  document.getElementById('error1').innerHTML= "";
      }
      function msgDelete2(){
    	  document.getElementById('error2').innerHTML= "";
      }
   function msgDelete222()
        {
        	document.getElementById('ulerror22').innerHTML= "";
        }
        function msgDelete333()
        {
        	document.getElementById('lerror33').innerHTML= "";
        }
        function msgDelete444()
        {
        	document.getElementById('ulerror44').innerHTML= "";
        }
        function msgDelete555()
        {
        	document.getElementById('ulerror55').innerHTML= "";
        }
       

        
        
        function update_lab_validate(){
        	var name=document.updatelab.ulname.value;
        	var from=document.updatelab.utime_from.value;
        	var to=document.updatelab.utime_to.value;
        	var email=document.updatelab.ulemail.value;
        	var phn=document.updatelab.ulphn.value;
        	var password=document.updatelab.password.value;
        	var npassword=document.updatelab.npassword.value;
        	var cpassword=document.updatelab.cpassword.value;
        	var flag=true;
        	if(password=="" || password==null){
        		fontcolor="red";
        		document.getElementById('error').innerHTML= "<span style=\"color:red\">Enter Current Password </span>";
        		
        		flag = false;
        	}
        	if(npassword=="" || npassword==null){
        		fontcolor="red";
        		document.getElementById('error1').innerHTML= "<span style=\"color:red\">Enter new Password </span>";
        		
        		flag = false;
        	}
        	if(cpassword=="" || cpassword==null){
        		fontcolor="red";
        		document.getElementById('error2').innerHTML= "<span style=\"color:red\">Enter Confirm Password </span>";
        		
        		flag = false;
        	}
        	if(cpassword!=npassword){
        		fontcolor="red";
        		document.getElementById('error2').innerHTML= "<span style=\"color:red\">Confirm password doesnot match with new password. </span>";
        		
        		flag = false;
        	}
        	if(name==""|| name==null){
        		
        		fontcolor="red";
        		document.getElementById('ulerror').innerHTML= "<span style=\"color:red\">Enter Lab Name </span>";
        		
        		flag = false;
        	}
        	else if(name.length<3){
        		fontcolor="red";
        		document.getElementById('ulerror').innerHTML= "<span style=\"color:red\">Minimum 3 characters </span>";
        		//alert("minnn");
        		flag = false;
        	}
        	else if(name.length>20){
        		fontcolor="red";
        		document.getElementById('ulerror').innerHTML= "<span style=\"color:red\">Maximum 20 characters </span>";
        		//alert("minnn");
        		flag = false;
        	}

if(from==""|| from==null){
	
	fontcolor="red";
	document.getElementById('ulerror44').innerHTML= "<span style=\"color:red\">Time is Required </span>";
	
	flag = false;
}
if(to==""|| to==null)
	{
	fontcolor="red";
	document.getElementById('ulerror22').innerHTML= "<span style=\"color:red\">Time is Required </span>";
	
	flag = false;
	}
if(email==""|| email==null){
	
	fontcolor="red";
	document.getElementById('ulerror55').innerHTML= "<span style=\"color:red\">Email is Required </span>";
	
	flag = false;
}
if(phn==""|| phn==null){
	
	fontcolor="red";
	document.getElementById('ulerror66').innerHTML= "<span style=\"color:red\">Enter Your Phone Number </span>";
	
	flag = false;
}
else if(phn.length!=10){
	fontcolor="red";
	document.getElementById('ulerror66').innerHTML= "<span style=\"color:red\">Phone Number should be 10 digits </span>";
	//alert("minnn");
	flag = false;
}
if(flag==false){
	return false;
}
else{
	return true;
	}

        	
        }       
        
</script>
  
  
  
  
    <%
try{
	
	String un =(String)session.getAttribute("lab");
    if(un==null){response.sendRedirect("login.jsp");}
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
		 ResultSet rs=stmt.executeQuery("Select * from lab_details where lab_user_id='"+un+"'");  
		 rs.next();
		 String name;
		// String labid=rs.getString(1);
		 name=rs.getString(2);
		 //String reg =rs.getString(3);
		 
		 %>  	

  
    <!--=============================================== 
    Template Design By WpFreeware Team.
    Author URI : http://www.wpfreeware.com/
    ====================================================-->

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <title>Thyrodictor : Lab</title>

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
                <li><a href="lab_home.jsp"><span class="glyphicon glyphicon-home"></span></a></li><li></li>
                 <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-triangle-bottom"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="lab_view_details.jsp"><%=name %></a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                   </ul>
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
                <h2>Laboratory : <%=name %></h2>
              </div>
              <div class="blog-breadcrumbs-right">
                <ol class="breadcrumb">
                  <li>You are here</li>
                                   
                  <li><a href="lab_home.jsp">Lab Home</a></li>
                  <li class="active">Update Profile</li>
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
		<div class="row">
			<div class="col-lg-4 col-md-4"></div>
			<div class="col-lg-4 col-md-4">
			<center><h3><b>Update Profile Details</b></h3></center>
			</div>
			<div class="col-lg-4 col-md-4"></div>
		</div>
		
		
		 <form class="appointment-form" id="updatelab" name="updatelab" method="post" action="lab_update_db.jsp" onsubmit="return update_lab_validate();">
		                       <div class="row">
		                       <div class="col-md-6 col-sm-6">
                              <label for="ulname" class="control-label">Lab name <span class="required">*</span>
                              </label>
                              <input type="text" id="ulname" name="ulname" class="wp-form-control wpcf7-text" value="<%=rs.getString(2) %>" onkeypress="return onlyAlphabets2(event,this);" onchange="return onlyAlphabets2(event,this);" >
                              <br>
                              	<p id="ulerror"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label for="ulemail" class="control-label">Your Email <span class="required">*</span>
                              </label>
                              <input type="uemail" id="ulemail" name="ulemail" class="wp-form-control wpcf7-email" value="<%=rs.getString(8) %>" onchange="return msgDelete555();">  
                             <br>
                            <p id="ulerror55"></p>
                            </div>     
                            </div>
                            <div class="row">
                           <div class="col-md-6 col-sm-6">
                              <label for="utime_from" class="control-label">Lab Timings From :  <span class="required">*</span>
                              </label>
                              <input type="time" id="utime_from" name="utime_from" class="wp-form-control wpcf7-text" value="<%=rs.getString(5) %>" onchange="return msgDelete444();">
                            <br>
                            <p id="ulerror44"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label for="utime_to" class="control-label">To :  <span class="required">*</span>
                              </label>
                              <input type="time" id="utime_to" name="utime_to" class="wp-form-control wpcf7-text" value="<%=rs.getString(6) %>" onchange="return msgDelete222();">
                               <br>
                            <p id="ulerror22"></p>
                              </div>
                            </div>
                            
                            
                            <div class="row">
                                               
                                 <div class="col-md-6 col-sm-6">
                              <label for="ulphn" class="control-label">Your Phone <span class="required">*</span>
                              </label>
                              <input type="text" id="ulphn" name="ulphn" class="wp-form-control wpcf7-text" value="<%=rs.getString(7) %>" onkeypress="return onlyNumbers2(event,this);" onchange="return onlyNumbers2(event,this);">  
                               <br>
                            <p id="ulerror66"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                             <label for="password" class="control-label"> Current Password<span class="required">*</span>
                              </label>
                              <input type="password" id="password" name="password" class="wp-form-control wpcf7-text" value="" onchange="return msgDelete();">  
                            <br>
                            <p id="error"></p>
                             </div>
                          </div>
                          <div class="row">
                          <div class="col-md-6 col-sm-6">
                             <label for="password" class="control-label"> New Password<span class="required">*</span>
                              </label>
                              <input type="password" id="npassword" name="npassword" class="wp-form-control wpcf7-text" value="" onchange="return msgDelete1();">  
                            <br>
                            <p id="error1"></p>
                             </div>
                             <div class="col-md-6 col-sm-6">
                             <label for="cpassword" class="control-label"> Confirm Password<span class="required">*</span>
                              </label>
                              <input type="password" id="cpassword" name="cpassword" class="wp-form-control wpcf7-text" value="" onchange="return msgDelete2();">  
                            <br>
                            <p id="error2"></p>
                             </div>
                          </div>
                            <div class="row">
			<div class="col-lg-4 col-md-4"></div>
			<div class="col-lg-4 col-md-4"><div class="readmore_area" align="right">
					<!-- a href="lab_update_db.jsp" data-hover="UPDATE"><span>UPDATE</span></a--> 
					      <button class="wpcf7-submit button--itzel" type="submit"><i class="button__icon fa fa-share"></i><span>UPDATE</span></button>     
				</div></div>
			<div class="col-lg-4 col-md-4"></div>
		</div>                            
                            
      </form>
	
	
		</div>
		</section>
		
		
		
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
              <p>&copy; Copyright 2018 <a href="index.html">Thyrodictor</a></p>
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
         		 con.close();	
	}
	
}
catch(Exception ex){
	out.println("Exception \n\n"+ex);
}

%>  