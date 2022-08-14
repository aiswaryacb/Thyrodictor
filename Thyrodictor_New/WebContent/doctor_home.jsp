<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<% 
try{
	
	String un =(String)session.getAttribute("doctor");
 
	
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
		 ResultSet rs=stmt.executeQuery("Select * from doctor_details where doctor_user_id='"+un+"'");  
		 if(rs.next())
		 {
		 String name;
		 name=rs.getString(3);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  	

  
    <!--=============================================== 
    Template Design By WpFreeware Team.
    Author URI : http://www.wpfreeware.com/
    ====================================================-->

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <title>Thyrodictor : Doctor</title>

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
        <script language="javascript" type="text/javascript">  
 var xmlHttp  
 var xmlHttp
function showState(str){ 
	 document.getElementById('herror5').innerHTML= "";
       if (typeof XMLHttpRequest != "undefined"){
   xmlHttp= new XMLHttpRequest();
       }
       else if (window.ActiveXObject){
   xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
       }
if (xmlHttp==null){
    alert ("Browser does not support XMLHTTP Request")
return
} 
var url= "district.jsp";
url += "?count=" +str;
xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
 function stateChange(){   
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){  
	 
 document.getElementById("hdistrict").innerHTML=xmlHttp.responseText
 }   
 }
 </script>
 <script type="text/javascript"> 
var SECONDS = 5; 

function showMessage() { 
window.setInterval("blankMessage()", SECONDS * 1000); 
} 
function blankMessage() { 
document.getElementById("msg").innerHTML = ""; 
} 


function onlyAlphabets(e, t) {
    try {
    	document.getElementById('herror').innerHTML= "";
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
function onlyNumbers(e, t) {
    try {
    	document.getElementById('herror2').innerHTML= "";
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



function msgDelete3()
{
	document.getElementById('herror3').innerHTML= "";
}
function msgDelete4()
{
	document.getElementById('herror4').innerHTML= "";
}
function msgDelete5()
{
	document.getElementById('herror5').innerHTML= "";
}
function msgDelete6()
{
	document.getElementById('herror6').innerHTML= "";
}
function msgDelete7()
{
	document.getElementById('herror7').innerHTML= "";
}

function hospital_validate(){
	var name=document.hospital.hname.value;
	//var photo=document.hospital.pphoto.value;
	//var dob=document.hospital.pdob.value;
	//var gender=document.hospital.pgender.value;
	//var email=document.hospital.pemail.value;
	var phn=document.hospital.hphn.value;
	var from=document.hospital.time_from.value;
	var to=document.hospital.time_to.value;
	var state=document.hospital.hstate.value;
	var district=document.hospital.hdistrict.value;
	var flag=true;
	if(name==""|| name==null){
		
		fontcolor="red";
		document.getElementById('herror').innerHTML= "<span style=\"color:red\">Enter Hospital Name </span>";
		
		//return false;
		flag=false;
	}
	else if(name.length<3){
		fontcolor="red";
		document.getElementById('herror').innerHTML= "<span style=\"color:red\">Minimum 3 characters </span>";
		//alert("minnn");
		flag=false;
		//return false;
	}
	else if(name.length>20){
		fontcolor="red";
		document.getElementById('herror').innerHTML= "<span style=\"color:red\">Maximum 20 characters </span>";
		//alert("minnn");
		flag=false;
		//return false;
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
if(phn==""|| phn==null){

fontcolor="red";
document.getElementById('herror2').innerHTML= "<span style=\"color:red\">Enter Phone Number </span>";
flag=false;
//return false;
}
else if(phn.length!=10){
fontcolor="red";
document.getElementById('herror2').innerHTML= "<span style=\"color:red\">Phone Number should be 10 digits </span>";
//alert("minnn");
flag=false;
//return false;
}


if(from==""|| from==null){
	
	fontcolor="red";
	document.getElementById('herror3').innerHTML= "<span style=\"color:red\">Time is Required </span>";
	flag=false;
	//return false;
}
if(to==""|| to==null)
	{
	fontcolor="red";
	document.getElementById('herror4').innerHTML= "<span style=\"color:red\">Time is Required </span>";
	flag=false;
	//return false;
	}



if(state==""|| state==null){

fontcolor="red";
document.getElementById('herror5').innerHTML= "<span style=\"color:red\">Select Your State </span>";
flag=false;
//return false;
}
else if(state=="none")
{
fontcolor="red";
document.getElementById('herror5').innerHTML= "<span style=\"color:red\">Select Your State </span>";
flag=false;
//return false;
}
if(district==""|| district==null){

fontcolor="red";
document.getElementById('herror6').innerHTML= "<span style=\"color:red\">Select Your District </span>";
flag=false;
//return false;
}
else if(district=="none1")
{
fontcolor="red";
document.getElementById('herror6').innerHTML= "<span style=\"color:red\">Select Your District </span>";
flag=false;
//return false;
}
/*if(days==""|| days==null){

fontcolor="red";
document.getElementById('herror7').innerHTML= "<span style=\"color:red\">Enter days </span>";
flag=false;
//return false;
}*/

if(flag==false){
	return false;
}
else{
return true;
}

	
}











</script>
  </head>
  <body onload="showMessage()">    
  
  
  
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
                <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li><li></li>
                <li><a href="doctor_messages.jsp"><span class="glyphicon glyphicon-envelope"></span></a></li><li></li>
                 <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-triangle-bottom"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="doctor_view_details.jsp"><%=name %></a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                  </ul>
                </li>
                
              </ul>           
            </div><!--/.nav-collapse -->           
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
                <h2>Welcome <%=name %></h2>
              </div>
              <div class="blog-breadcrumbs-right">
                <ol class="breadcrumb">
                  <li>You are here</li>
                                   
                  <li class="active">Doctor Home</li>
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
			if(status.equals("success")){
				out.print("Successfully added hospital details!!");
			}
			else{}
		}
		catch(Exception e){
			response.sendRedirect("index.html");
		}
					%>
				</h4></center>
      </div>     
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
          <div class="col-lg-12 col-md-12">
            <div class="service-area">
              <!-- Start Service Title -->
              
              <!-- Start Service Content -->
              <div class="service-content">
                <div class="row">
                  <!-- Start Single Service -->
                   <div class="col-lg-2 col-md-2"></div>
                  <div class="col-lg-4 col-md-4">
                    <div class="single-service">
                                          
                      <h3><a data-toggle="modal" data-target="#myModal-3" href="#" data-hover="Add Hospital Details"><span>Add Hospital Details</span></a></h3>
                  
              <!-- start modal window -->
              <div class="modal fade" id="myModal-3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-3" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="myModalLabel-3">Hospital Details</h4>
                    </div>
                    <div class="modal-body">
                      <div class="appointment-area">
                        <form class="appointment-form" id="hospital" name="hospital" method="post" action="doctor_add_hospital_db.jsp" onsubmit="return hospital_validate();">
                          
                          
                          <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <label for="hname" class="control-label">Hospital name <span class="required">*</span>
                              </label>
                              <input type="text" id="hname" name="hname" class="wp-form-control wpcf7-text" placeholder="Hospital name" onchange="return onlyAlphabets(event,this);" onkeypress="return onlyAlphabets(event,this);">
                           		<br>
                           		<p id="herror"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                               <label for="hphn" class="control-label">Hospital Phone <span class="required">*</span>
                              </label>
                              <input type="text" id="hphn" name="hphn" class="wp-form-control wpcf7-text" placeholder="Phone No" onkeypress="return onlyNumbers(event,this);" onchange="return onlyNumbers(event,this);">  
                              <br>
                            <p id="herror2"></p>
                            
                            </div>
                          </div>
                          
                          
                           <div class="row">
                           <div class="col-md-6 col-sm-6">
                              <label for="time_from" class="control-label">Timings From :  <span class="required">*</span>
                              </label>
                              <input type="time" id="time_from" name="time_from" class="wp-form-control wpcf7-text" onchange="return msgDelete3();">
                              <br>
                            <p id="herror3"></p>
                            
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label for="time_to" class="control-label">To :  <span class="required">*</span>
                              </label>
                              <input type="time" id="time_to" name="time_to" class="wp-form-control wpcf7-text" onchange="return msgDelete4();">
                               <br>
                            <p id="herror4"></p>
                              </div>
                            </div>
                      
                      
                         <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <label for="hstate" class="control-label">Select State <span class="required">*</span>
                              </label>
                               <select name='hstate' onchange="showState(this.value)" class="wp-form-control wpcf7-select">  
  									<option value="none">State</option>  
 											 <%
												 ResultSet rs2 = stmt.executeQuery("Select * from state;");
												 while(rs2.next()){
     											%>
 									<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>  
											 <%
												}
     											%>      
 							  </select>
 							  <br>
 							<p id="herror5"></p>
                            </div>                                               
                            <div class="col-md-6 col-sm-6">
                              <label for="hdistrict" class="control-label">Select District <span class="required">*</span>
                              </label>
                              <select id="hdistrict" name="hdistrict" class="wp-form-control wpcf7-select" onchange="return msgDelete6();">
                              <option value="none">District</option>
                                
                              </select> 
                              <br>
 							<p id="herror6"></p>
                            </div>                          
                            </div> 
                            
                              
                            <div class="row">
                             <div class="col-md-12 col-sm-8">
                              <label for="days" class="control-label">Days<span class="required">*</span>
                              </label><br>
                              <input type="checkbox" name="days" value="Sunday">Sunday
							  <input type="checkbox" name="days" value="Monday">Monday
							  <input type="checkbox" name="days" value="Tuesday">Tuesday
							  <input type="checkbox" name="days" value="Wednesday">Wednesday
							  <input type="checkbox" name="days" value="Thursday">Thursday
							  <input type="checkbox" name="days" value="Friday">Friday
							  <input type="checkbox" name="days" value="Saturday">Saturday
                            </div>                       
                                 <div class="col-md-6 col-sm-6">
                            </div>
                          </div>
                         
                          
                          <div class="row">                            
                          <div class="col-md-12 col-sm-12">
                          <button class="wpcf7-submit button--itzel" type="submit"><i class="button__icon fa fa-share"></i><span>ADD</span></button>  
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
        <div class="row">
        <div class="col-lg-2 col-md-2"></div>
                  <div class="col-lg-2 col-md-4">
                    <div class="single-service">                 
                      <h3><a href="doctor_area_analysis.jsp" data-hover="View Area Analysis"><span>Area Analysis</span></a></h3>
                      </div>
                   
                  </div>
                  </div>
      </div>
      
    </section>
            
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
		 }
         		 con.close();	
	}
	
}
catch(Exception ex){
	out.println("Exception \n\n"+ex );
}

%>