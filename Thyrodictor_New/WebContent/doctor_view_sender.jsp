<%@page import="com.sun.org.apache.regexp.internal.RESyntaxException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
 <%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
        <%
try{
	
	String un =(String)session.getAttribute("doctor");
 	String userid = request.getParameter("userid");
	
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
		 ResultSet rs=stmt.executeQuery("Select * from doctor_details where doctor_user_id='"+un+"'");  
		 if(rs.next())
		 {
		 String name;
		 name=rs.getString(3);
		 ResultSet rs1= stmt.executeQuery("select * from login_details where login_id='"+userid+"';");
		 rs1.next();
		 String usertype=rs1.getString(2);
		 ResultSet rs2=null;
		 ResultSet rsd = stmt.executeQuery("select * from district;");
			rsd.last();
			int n= rsd.getRow();
			rsd.beforeFirst();
			String dist_id[] = new String[n];
			String dist_name[] = new String[n];
			int i=-1;
			while(rsd.next()){
				i++;
				dist_id[i]= rsd.getString(1);
				dist_name[i]=rsd.getString(3);
			}
		 
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
                <li><a href="doctor_home.jsp"><span class="glyphicon glyphicon-home"></span></a></li><li></li>
                <li><a href="doctor_messages.jsp?msg="><span class="glyphicon glyphicon-envelope"></span></a></li><li></li>
                 <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-triangle-bottom"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="doctor_view_details.jsp"><%=name %></a></li>
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
                  <li><a href="doctor_home.jsp">Patient Home</a></li>
                  <li><a href="doctor_messages.jsp">Messages</a></li>
                  <li class="active">View Sender Details</li>
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
			<center><h3><b>Profile Details</b></h3></center>
			</div>
			<div class="col-lg-4 col-md-4"></div>
		</div>               	  
<%
if(usertype.equals("patient")){
	rs2=stmt.executeQuery("select * from patient_details where patient_user_id='"+userid+"';");
	rs2.next();
	%>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">User Id: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(8) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Patient Name: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(2) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Gender: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(3) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Dob: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(4) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Email: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(5) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>	
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Phone: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(6) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	<%
	ResultSet pd = stmt.executeQuery("select * from investigation_details where patient_id='"+rs2.getString(1)+"';");
	if(pd.next()){
	
	%>
	<br><br>
	<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-8 col-md-8"><center><i><b>Medical Details</b></i></center></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
				<div class="col-lg-8 col-md-8">
				<table class="table">
					<thead>
					<tr>
						<th>Age</th>
						<th>Date</th>
						<th>TSH</th>
						<th>T3</th>
						<th>T4</th>
						<th>Height</th>
						<th>Weight</th>
						<th>Result</th>
					</tr>
					</thead>
					<tr>
						<td><%=pd.getString(3) %></td>
						<td><%=pd.getString(4) %></td>
						<td><%=pd.getString(5) %></td>
						<td><%=pd.getString(6) %></td>
						<td><%=pd.getString(7) %></td>
						<td><%=pd.getString(8) %></td>
						<td><%=pd.getString(9) %></td>
						<td><%=pd.getString(10) %></td>
					</tr>
					<%
					while(pd.next()){
					%>
					<tr>
						<td><%=pd.getString(3) %></td>
						<td><%=pd.getString(4) %></td>
						<td><%=pd.getString(5) %></td>
						<td><%=pd.getString(6) %></td>
						<td><%=pd.getString(7) %></td>
						<td><%=pd.getString(8) %></td>
						<td><%=pd.getString(9) %></td>
						<td><%=pd.getString(10) %></td>
					</tr>
					<% } %>
				</table>
				</div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
	<%
	}
	else{
		%>
	}
	<br><br>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-8 col-md-8"><i><b> No Medical Details Available!</b></i></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
	<%
	}
}
else if(usertype.equals("doctor")){
	rs2=stmt.executeQuery("select * from doctor_details where doctor_user_id='"+userid+"';");	
	rs2.next();
	%>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">User Id: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(7) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Doctor Name: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(3) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div><div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Gender: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(6) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Register Number: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(2) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Email: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(4) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	<div class="row">
		<div class="col-lg-2 col-md-2"></div>
		<div class="col-lg-4 col-md-4">Phone: </div>
		<div class="col-lg-4 col-md-4"><%=rs2.getString(5) %></div>
		<div class="col-lg-2 col-md-2"></div>
	</div>
	
	<%
	ResultSet rs3= stmt.executeQuery("select * from hospital_details where doctor_id='"+rs2.getString(1)+"';");
	while(rs3.next()){
	%>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">Hospital Name: </div>
			<div class="col-lg-4 col-md-4"><%=rs3.getString(3) %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">OP Timing: </div>
			<div class="col-lg-4 col-md-4"><%=rs3.getString(5) %> to <%=rs3.getString(6) %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">OP days: </div>
			<div class="col-lg-4 col-md-4"><%=rs.getString(7) %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">Phone: </div>
			<div class="col-lg-4 col-md-4"><%=rs.getString(8) %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		
	<%
	//while(rs1.next()){
		String placeid=rs3.getString(4);
    	 String place="";
    	for(i=0;i<n;i++){
    		if(dist_id[i].equals(placeid)){
    			place=dist_name[i];
    		}
    	}
    	%>
    	<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">Place: </div>
			<div class="col-lg-4 col-md-4"><%=place %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
    	<%
	}
}
	else if(usertype.equals("lab")){
		rs2=stmt.executeQuery("select * from lab_details where lab_user_id='"+userid+"';");
		rs2.next();
		%>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">User ID: </div>
			<div class="col-lg-4 col-md-4"><%=rs2.getString(9) %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">Lab Name: </div>
			<div class="col-lg-4 col-md-4"><%=rs2.getString(2) %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">Timing: </div>
			<div class="col-lg-4 col-md-4"><%=rs2.getString(5) %> to <%=rs2.getString(6) %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">Email: </div>
			<div class="col-lg-4 col-md-4"><%=rs2.getString(8) %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">Phone: </div>
			<div class="col-lg-4 col-md-4"><%=rs2.getString(7) %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<%
	String placeid=rs2.getString(4);
   	 String place="";
   	for(i=0;i<n;i++){
   		if(dist_id[i].equals(placeid)){
   			place=dist_name[i];
   		}
   	}
		%>
		<div class="row">
			<div class="col-lg-2 col-md-2"></div>
			<div class="col-lg-4 col-md-4">place: </div>
			<div class="col-lg-4 col-md-4"><%=place %></div>
			<div class="col-lg-2 col-md-2"></div>
		</div>
		<%
	}
%>
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