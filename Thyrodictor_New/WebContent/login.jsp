<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  <script language="javascript" type="text/javascript">
  function msgDelete()
  {
  	document.getElementById('error').innerHTML= "";
  }
  function msgDelete1()
  {
  	document.getElementById('error1').innerHTML= "";
  }
  function msgDelete2()
  {
  	document.getElementById('error2').innerHTML= "";
  }
  function msgDelete3()
  {
  	document.getElementById('error3').innerHTML= "";
  }
  function msgDelete4()
  {
  	document.getElementById('error4').innerHTML= "";
  }
  function msgDelete5()
  {
  	document.getElementById('error5').innerHTML= "";
  }
  
  
  function validate1(){

	  	var user_id=login.user_id.value;
		var password=login.password.value;
	 
	if(user_id==""|| user_id==null){

	fontcolor="red";
	document.getElementById('error').innerHTML= "<span style=\"color:red\">User ID is Required </span>";

	return false;
	}

	else if(password==""||password==null){
		fontcolor="red";
		document.getElementById('error1').innerHTML= "<span style=\"color:red\">Password is Required </span>";

		return false;
	}
	else{
	return true;
	}

	  	
	  }
  

  </script>
  <script type="text/javascript"> 

//var MESSAGE = "Thank You!"; 
var SECONDS = 5; 

function showMessage() { 
//document.getElementById("msg").innerHTML = MESSAGE; 
window.setInterval("blankMessage()", SECONDS * 1000); 
} 

function blankMessage() { 
document.getElementById("msg").innerHTML = ""; 
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
     <title>Thyrodictor : Login</title>

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
  <body onload="showMessage()" >    
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
                <li><a href="index.html">Home</a></li>
                <li><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span> Signup</a></li>
                <li class="active"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
                <h2>Login Here !</h2>
                
              </div>
              <div class="blog-breadcrumbs-right">
                <ol class="breadcrumb">
                  <li>You are here</li>
                  <li><a href="index.html">Home</a></li>                  
                  <li class="active">Login</li>
                </ol>
              </div>
            </div>
          </div>
        </div>        
      </div> 
      <div class="row" id="msg">
      <center><h4><%
      				try{
						String status=request.getParameter("status");
						if(status.equals("true")){
							out.print("Signup request has been sent.");
						}else if(status.equals("denied")){
							out.print("Sorry! Your signup request has been denied.");
						}else if(status.equals("logout")){
							out.print("You have been successfully logged out!");
						}else if(status.equals("mailsent")){
							out.print("Your password has been mailed to the registered mail id.");
						}else if(status.equals("mailfailed")){
							out.print("Error: unable to send message....");
						}else if(status.equals("invalidid")){
							out.print("Sorry! No such user exist");
						}else if(status.equals("er")){
							out.print("Invalid username or password!");
						}else{}
							
      				}
      				catch(Exception e){
      					response.sendRedirect("index.html");
      				}
					%>
				</h4></center>
      </div>     
    </section>
   <section id="errorPage">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12">
            <div class="error-page-area">
              <div class="col-lg-12 col-md-12">
            <div class="row">
              <div class="col-lg-5 col-md-6 col-sm-6 col-xs-12">
                <div class="whyChoose-left">
                  <div class="whychoose-slider">
                    <div class="whychoose-singleslide">
                      <img src="images/choose-us-img1.jpg" alt="img">
                    </div>
                    <div class="whychoose-singleslide">
                      <img src="images/choose-us-img2.jpg" alt="img">
                    </div>
                    <div class="whychoose-singleslide">
                      <img src="images/choose-us-img3.jpg" alt="img">
                    </div>
                  </div>
                </div>
              </div>
              <h5>Welcome to Thyrodictor</h5>
    
   <div class="readmore_area" align="right">
                <a data-toggle="modal" data-target="#myModal" href="#" data-hover="&nbsp;&nbsp;&nbsp;&nbsp;Login Here&nbsp;&nbsp;&nbsp;"><span>&nbsp;&nbsp;&nbsp;&nbsp;Login Here&nbsp;&nbsp;&nbsp;</span></a>    
              </div>
              <!-- start modal window -->
              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="myModalLabel">Login Details</h4>
                    </div>
                    <div class="modal-body">
                      <div class="appointment-area">
                        <form class="appointment-form"  id="login" name="login" method="post" action="userval.jsp" onsubmit="return validate1();" >
                        <!--div class="row">
                        <div class="col-md-6 col-sm-6">
                              <label for="usertype" class="control-label">Enter the User Type <span class="required">*</span>
                              </label>
                              
                              <select id="usertype" name="usertype" class="wp-form-control wpcf7-select">
                                <option value="P">Patient</option>
                                <option value="D">Doctor</option>
                                <option value="L">Lab</option>
                                <option value="Admin">Admin</option>
                              </select> 
                              </div>
                        </div-->
                        
                        <div class="row">
                        	<div class="col-md-2 col-sm-2"></div>
                             <div class="col-md-8 col-sm-8">
                              <label for="user_id" class="control-label">User ID <span class="required">*</span>
                              </label>
                              <input type="text" id="user_id" name="user_id" class="wp-form-control wpcf7-text" placeholder="User ID"  onchange="return msgDelete();">
                              <p id="error"></p>  
                            </div>
                            <div class="col-md-2 col-sm-2"></div>
                            </div> 
                            <div class="row">  
                            <div class="col-md-2 col-sm-2"></div>             
                            <div class="col-md-8 col-sm-8">
                              <label for="password" class="control-label">Password <span class="required">*</span></label>
                              <input type="password" id="password" name="password" class="wp-form-control wpcf7-text" placeholder="********"  onchange="return msgDelete1();">
                              <p id="error1"></p> 
                            </div>
                            <div class="col-md-2 col-sm-2"></div>
                          </div>
                           <div class="row">
                           <div class="col-md-2 col-sm-2"></div>
                         <div class="col-md-8 col-sm-8">
                         <a class="control-link" href="forgot.jsp">Forgot Password ?</a>
                         </div>
                         <div class="col-md-2 col-sm-2"></div>
                         </div>
                            
                                                                                    
                          <div class="row">
                          <div class="col-md-2 col-sm-2"></div>             
                             
                          <!-- input type="text" class="wp-form-control wpcf7-text" placeholder="Subject">
                          <textarea class="wp-form-control wpcf7-textarea" cols="30" rows="10" placeholder="What would you like to tell us"></textarea!-->
                         <div class="col-md-8 col-sm-8">
                         <button class="wpcf7-submit button--itzel" type="submit"><i class="button__icon fa fa-share"></i><span>Login</span></button>  
                         </div>
                         <div class="col-md-2 col-sm-2"></div>
                         </div>
                        </form>
                      </div>
                    </div>       
                      
                            
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div><!-- /.modal -->
              
              
                            
                         <br><br>
               </div>
          </div>
        </div>
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