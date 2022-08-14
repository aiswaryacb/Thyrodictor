<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
        <%
try{
	
	String un =(String)session.getAttribute("patient");
 
	
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
  	function msgDelete1()
    {
    	document.getElementById('perror1').innerHTML= "";
    }
  	function msgDelete2()
    {
    	document.getElementById('perror2').innerHTML= "";
    }
    function msgDelete3()
    {
    	document.getElementById('perror3').innerHTML= "";
    }
    function msgDelete4()
    {
    	document.getElementById('perror4').innerHTML= "";
    }
    function msgDelete5()
    {
    	document.getElementById('perror5').innerHTML= "";
    }
    function msgDelete6()
    {
    	document.getElementById('perror6').innerHTML= "";
    }
    function msgDelete7()
    {
    	document.getElementById('perror7').innerHTML= "";
    }
    function msgDelete8()
    {
    	document.getElementById('perror8').innerHTML= "";
    }
    function msgDelete9()
    {
    	document.getElementById('perror9').innerHTML= "";
    }
  	function msgDelete10()
  	{
  		document.getElementById('perror10').innerHTML="";
  	}
  	function msgDelete11()
    {
    	document.getElementById('perror11').innerHTML= "";
    }
  	function msgDelete12()
    {
    	document.getElementById('perror12').innerHTML= "";
    }
    function msgDelete13()
    {
    	document.getElementById('perror13').innerHTML= "";
    }
    function msgDelete14()
    {
    	document.getElementById('perror14').innerHTML= "";
    }
    function msgDelete15()
    {
    	document.getElementById('perror15').innerHTML= "";
    }
    function msgDelete16()
    {
    	document.getElementById('perror16').innerHTML= "";
    }
    function msgDelete17()
    {
    	document.getElementById('perror17').innerHTML= "";
    }
    function msgDelete18()
    {
    	document.getElementById('perror18').innerHTML= "";
    }
    function msgDelete19()
    {
    	document.getElementById('perror19').innerHTML= "";
    }
  	function msgDelete20()
  	{
  		document.getElementById('perror20').innerHTML="";
  	}
  	function msgDelete21()
    {
    	document.getElementById('perror21').innerHTML= "";
    }
  	function msgDelete22()
    {
    	document.getElementById('perror22').innerHTML= "";
    }
    function msgDelete23()
    {
    	document.getElementById('perror23').innerHTML= "";
    }
    function msgDelete24()
    {
    	document.getElementById('perror24').innerHTML= "";
    }
    function msgDelete25()
    {
    	document.getElementById('perror25').innerHTML= "";
    }
    function msgDelete26()
    {
    	document.getElementById('perror26').innerHTML= "";
    }
    function msgDelete27()
    {
    	document.getElementById('perror27').innerHTML= "";
    }
    function msgDelete28()
    {
    	document.getElementById('perror28').innerHTML= "";
    }
    function msgDelete29()
    {
    	document.getElementById('perror29').innerHTML= "";
    }
  	function msgDelete30()
  	{
  		document.getElementById('perror30').innerHTML="";
  	}
  	function msgDelete31()
    {
    	document.getElementById('perror31').innerHTML= "";
    }
  	function msgDelete32()
    {
    	document.getElementById('perror32').innerHTML= "";
    }
    function msgDelete33()
    {
    	document.getElementById('perror33').innerHTML= "";
    }
    function msgDelete34()
    {
    	document.getElementById('perror34').innerHTML= "";
    }
    function msgDelete35()
    {
    	document.getElementById('perror35').innerHTML= "";
    }
    function msgDelete36()
    {
    	document.getElementById('perror36').innerHTML= "";
    }
    function msgDelete37()
    {
    	document.getElementById('perror37').innerHTML= "";
    }
    function msgDelete38()
    {
    	document.getElementById('perror38').innerHTML= "";
    }
    function msgDelete39()
    {
    	document.getElementById('perror39').innerHTML= "";
    }
  	function msgDelete40()
  	{
  		document.getElementById('perror40').innerHTML="";
  	}
  	function message(){
  		document.getElementById('perror41').innerHTML= "<span style=\"color:red\"> Fill out all the fields </span>";
  	}

  	function validate()
  	{
  		var qn1=document.adult_female_symptoms.qn1.value;
  		var qn3=document.adult_female_symptoms.qn3.value;
  		var qn4=document.adult_female_symptoms.qn4.value;
  		var qn5=document.adult_female_symptoms.qn5.value;
  		var qn6=document.adult_female_symptoms.qn6.value;
  		var qn7=document.adult_female_symptoms.qn7.value;
  		var qn8=document.adult_female_symptoms.qn8.value;
  		var qn9=document.adult_female_symptoms.qn9.value;
  		var qn10=document.adult_female_symptoms.qn10.value;
  		var qn11=document.adult_female_symptoms.qn11.value;
  		var qn12=document.adult_female_symptoms.qn12.value;
  		var qn13=document.adult_female_symptoms.qn13.value;
  		var qn14=document.adult_female_symptoms.qn14.value;
  		var qn15=document.adult_female_symptoms.qn15.value;
  		var qn16=document.adult_female_symptoms.qn16.value;
  		var qn17=document.adult_female_symptoms.qn17.value;
  		var qn18=document.adult_female_symptoms.qn18.value;
  		var qn19=document.adult_female_symptoms.qn19.value;
  		var qn20=document.adult_female_symptoms.qn20.value;
  		var qn21=document.adult_female_symptoms.qn21.value;
  		var qn22=document.adult_female_symptoms.qn22.value;
  		var qn23=document.adult_female_symptoms.qn23.value;
  		var qn24=document.adult_female_symptoms.qn24.value;
  		var qn25=document.adult_female_symptoms.qn25.value;
  		var qn26=document.adult_female_symptoms.qn26.value;
  		var qn27=document.adult_female_symptoms.qn27.value;
  		var qn28=document.adult_female_symptoms.qn28.value;
  		var qn29=document.adult_female_symptoms.qn29.value;
  		var qn30=document.adult_female_symptoms.qn30.value;
  		var qn31=document.adult_female_symptoms.qn31.value;
  		var qn32=document.adult_female_symptoms.qn32.value;
  		var qn33=document.adult_female_symptoms.qn33.value;
  		var qn34=document.adult_female_symptoms.qn34.value;
  		var qn35=document.adult_female_symptoms.qn35.value;
  		var qn36=document.adult_female_symptoms.qn36.value;
  		var qn37=document.adult_female_symptoms.qn37.value;
  		var qn38=document.adult_female_symptoms.qn38.value;
  		var qn39=document.adult_female_symptoms.qn39.value;
  		var qn40=document.adult_female_symptoms.qn40.value;
  		var flag=true;
  		if(qn1==""|| qn1==null){
    		
    		fontcolor="red";
    		document.getElementById('perror1').innerHTML= "<span style=\"color:red\">Please fill out this field </span>";
    		
    		flag = false;
    	}  		
 if(qn3==""|| qn3==null){
    		
    		fontcolor="red";
    		document.getElementById('perror3').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
    		
    		flag = false;
    	}
//else if(qn4==""|| qn4==null){
  //  		
    //		fontcolor="red";
    	//	document.getElementById('perror4').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
    		
    		//flag = false;
    //	}
if(qn5==""|| qn5==null){
	
	fontcolor="red";
	document.getElementById('perror5').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
if(qn6==""|| qn6==null){
	
	fontcolor="red";
	document.getElementById('perror6').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn7==""|| qn7==null){
	
	fontcolor="red";
	document.getElementById('perror7').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn8==""|| qn8==null){
	
	fontcolor="red";
	document.getElementById('perror8').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn9==""|| qn9==null){
	
	fontcolor="red";
	document.getElementById('perror9').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn10==""|| qn10==null){
	
	fontcolor="red";
	document.getElementById('perror10').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn11==""|| qn11==null){
	
	fontcolor="red";
	document.getElementById('perror11').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn12==""|| qn12==null){
	
	fontcolor="red";
	document.getElementById('perror12').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn13==""|| qn13==null){
	
	fontcolor="red";
	document.getElementById('perror13').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn14==""|| qn14==null){
	
	fontcolor="red";
	document.getElementById('perror14').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn15==""|| qn15==null){
	
	fontcolor="red";
	document.getElementById('perror15').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn16==""|| qn16==null){
	
	fontcolor="red";
	document.getElementById('perror16').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn17==""|| qn17==null){
	
	fontcolor="red";
	document.getElementById('perror17').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn18==""|| qn18==null){
	
	fontcolor="red";
	document.getElementById('perror18').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn19==""|| qn19==null){
	
	fontcolor="red";
	document.getElementById('perror19').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn20==""|| qn20==null){
	
	fontcolor="red";
	document.getElementById('perror20').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn21==""|| qn21==null){
    		
    		fontcolor="red";
    		document.getElementById('perror21').innerHTML= "<span style=\"color:red\">Please fill out this field </span>";
    		
    		flag = false;
    	}
  		 if(qn22==""|| qn22==null){
    		
    		fontcolor="red";
    		document.getElementById('perror22').innerHTML= "<span style=\"color:red\">Please fill out this field </span>";
    		
    		flag = false;
    	}
  		 if(qn23==""|| qn23==null){
    		
    		fontcolor="red";
    		document.getElementById('perror23').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
    		
    		flag = false;
    	}
 if(qn24==""|| qn24==null){
    		
    		fontcolor="red";
    		document.getElementById('perror24').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
    		
    		flag = false;
    	}
 if(qn25==""|| qn25==null){
	
	fontcolor="red";
	document.getElementById('perror25').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn26==""|| qn26==null){
	
	fontcolor="red";
	document.getElementById('perror26').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn27==""|| qn27==null){
	
	fontcolor="red";
	document.getElementById('perror27').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn28==""|| qn28==null){
	
	fontcolor="red";
	document.getElementById('perror28').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn29==""|| qn29==null){
	
	fontcolor="red";
	document.getElementById('perror29').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn30==""|| qn30==null){
	
	fontcolor="red";
	document.getElementById('perror30').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn31==""|| qn31==null){
	
	fontcolor="red";
	document.getElementById('perror31').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn32==""|| qn32==null){
	
	fontcolor="red";
	document.getElementById('perror32').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn33==""|| qn33==null){
	
	fontcolor="red";
	document.getElementById('perror33').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn34==""|| qn34==null){
	
	fontcolor="red";
	document.getElementById('perror34').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn35==""|| qn35==null){
	
	fontcolor="red";
	document.getElementById('perror35').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn36==""|| qn36==null){
	
	fontcolor="red";
	document.getElementById('perror36').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn37==""|| qn37==null){
	
	fontcolor="red";
	document.getElementById('perror37').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn38==""|| qn38==null){
	
	fontcolor="red";
	document.getElementById('perror38').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn39==""|| qn39==null){
	
	fontcolor="red";
	document.getElementById('perror39').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
	flag = false;
}
 if(qn40==""|| qn40==null){
	
	fontcolor="red";
	document.getElementById('perror40').innerHTML= "<span style=\"color:red\"> Please fill out this field </span>";
	
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
              <a class="navbar-brand" href="#"><i class="fa fa-heartbeat"></i><span>Thyrodictor</span></a>              
              <!-- IMG BASED LOGO  -->
              <!--  <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="logo"></a>   -->     
                     
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul id="top-menu" class="nav navbar-nav navbar-right main-nav">
                <li><a href="patient_home.jsp"><span class="glyphicon glyphicon-home"></span></a></li><li></li>
                <li><a href="patient_messages.jsp"><span class="glyphicon glyphicon-envelope"></span></a></li><li></li>
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
                  <li class="active">Symptoms</li>
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
              <div class="section-heading">
                <h2>Enter Your Symptoms</h2>
                <div class="line"></div>
              </div>
              <!-- Start Service Content -->
              <div class="service-content">
                <div class="row">
                  <!-- Start Single Service -->
                  
                  <div class="col-lg-12 col-md-12">
                    <div class="single-service">
                      <div class="appointment-area">
                        <form class="appointment-form"  id="adult_female_symptoms" name="adult_female_symptoms" method="post" action="adult_symptoms_db.jsp" onsubmit="return validate();">
                        
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn1" class="control-label">Have you ever diagnosed thyroid disease ? <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror1"></p>
                              </div>
                             </div>
                            <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn1" name="qn1" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete1();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn1" name="qn1" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete1();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      
                        
                         
                         <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn3" class="control-label">Do you have any of the family members with diagnosed thyroid disease ? <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror3"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn3" name="qn3" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete3();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn3" name="qn3" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete3();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                         <br><br>
                               
                         <div class="row">
                        <div class="col-md-2 col-sm-2"></div>
                        <div class="col-md-8 col-sm-8">
                              <label for="qn4" class="control-label">Do you have any of the following medical problems ?<span class="required">*</span>
                              </label>
                              </div>
                        <div class="col-md-2 col-sm-2"></div>
                        </div>
                        <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror4"></p>
                              </div>
                             </div>
                        <div class="row">
                        <div class="col-md-1 col-sm-4"></div>
                        <div class="col-md-8 col-sm-8">
                        <br>
                              <input type="checkbox" name="qn4" value="Highblood pressure" >High blood pressure&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <input type="checkbox" name="qn4" value="High cholestrol" >High cholestrol&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <input type="checkbox" name="qn4" value="Diabates" >Diabates&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <input type="checkbox" name="qn4" value="Heart Disease" >Heart Disease&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <input type="checkbox" name="qn4" value="No" >Not Applicable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  </div>
							   <div class="col-md-2 col-sm-2"></div>
							   </div>
   							 <br><br><br>
                            <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-2 col-sm-4">
                              <label for="qn5" class="control-label">1. Palpitation<span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror5"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn5" name="qn5" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete5();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn5" name="qn5" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete5();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                            <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-4 col-sm-8">
                              <label for="qn6" class="control-label">2. Poor Concentration<span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror6"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn6" name="qn6" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete6();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn6" name="qn6" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete6();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>                       <br><br>
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-4 col-sm-8">
                              <label for="qn7" class="control-label">3. Memory Loss<span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror7"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn7" name="qn7" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete7();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn7" name="qn7" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete7();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>                            <br><br>
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-4 col-sm-8">
                              <label for="qn8" class="control-label">4. Difficulty in sleeping<span class="required">*</span>
                              </label>
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror8"></p>
                              
                             </div>
                              </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn8" name="qn8" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete8();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn8" name="qn8" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete8();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>                       
                       <br><br>
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-4 col-sm-8">
                              <label for="qn9" class="control-label">5. Excessive need for sleep<span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror9"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn9" name="qn9" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete9();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn9" name="qn9" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete9();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn10" class="control-label">6. Fatigue (Extreme tiredness resulting from mental or physical exertion or illness)<span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror10"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn10" name="qn10" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete10();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn10" name="qn10" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete10();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>                      
                       <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn11" class="control-label">7. Weak Muscles <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror11"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn11" name="qn11" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete11();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn11" name="qn11" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete11();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                       
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn12" class="control-label">8. Sore Muscles <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror12"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn12" name="qn12" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete12();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn12" name="qn12" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete12();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn13" class="control-label">9. Anxiety <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror13"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn13" name="qn13" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete13();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn13" name="qn13" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete13();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn14" class="control-label">10. Depression <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror14"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn14" name="qn14" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete14();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn14" name="qn14" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete14();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn15" class="control-label">11. Dry Skin <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror15"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn15" name="qn15" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete15();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn15" name="qn15" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete15();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn16" class="control-label">12. Itchy Skin <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror16"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn16" name="qn16" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete16();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn16" name="qn16" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete16();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn17" class="control-label">13. Unusual hair loss <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror17"></p>
                              </div>
                             </div><div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn17" name="qn17" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete17();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn17" name="qn17" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete17();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn18" class="control-label">14. Dry Hair <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror18"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn18" name="qn18" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete18();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn18" name="qn18" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete18();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn19" class="control-label">15. Peeling Nails <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror19"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn19" name="qn19" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete19();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn19" name="qn19" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete19();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn20" class="control-label">16. Ifnrequent bowel movement or hard stools <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror20"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn20" name="qn20" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete20();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn20" name="qn20" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete20();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn21" class="control-label">17. Frequent bowel movement or loose stools <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror21"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn21" name="qn21" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete21();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn21" name="qn21" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete21();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn22" class="control-label">18. Unexplained weight gain <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror22"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn22" name="qn22" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete22();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn22" name="qn22" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete22();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div> 
                             
                             <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn23" class="control-label">19. Unexplained weight loss <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror23"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn23" name="qn23" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete23();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn23" name="qn23" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete23();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>         
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn24" class="control-label">20. Persistent pain or swelling at the front of the neck <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror24"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn24" name="qn24" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete24();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn24" name="qn24" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete24();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>        
                             <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn25" class="control-label">21. Hoarseness (Ubnormal voice changes) <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror25"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn25" name="qn25" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete25();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn25" name="qn25" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete25();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>    
                       <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn26" class="control-label">22. Sensation of a lump in the throat <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror26"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn26" name="qn26" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete26();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn26" name="qn26" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete26();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>      
                       <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn27" class="control-label">23. Eye pain or double vision <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror27"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn27" name="qn27" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete27();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn27" name="qn27" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete27();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>   
                       <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn28" class="control-label">24. Swelling of eyes <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror28"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn28" name="qn28" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete28();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn28" name="qn28" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete28();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>     
                       <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn29" class="control-label">25. Change in facial appearence <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror29"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn29" name="qn29" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete29();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn29" name="qn29" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete29();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>          
                       <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn30" class="control-label">26. Difficulty in tolerating cold <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror30"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn30" name="qn30" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete30();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn30" name="qn30" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete30();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>       
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn31" class="control-label">27. Excessive sweating <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror31"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn31" name="qn31" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete31();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn31" name="qn31" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete31();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>     
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn32" class="control-label">28. Hand tremor <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror32"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn32" name="qn32" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete32();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn32" name="qn32" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete32();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>   
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn33" class="control-label">29. Loss of appetite <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror33"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn33" name="qn33" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete33();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn33" name="qn33" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete33();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>          
                             <br><br>
                              <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn34" class="control-label">30. Trouble swallowing <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror34"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn34" name="qn34" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete34();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn34" name="qn34" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete34();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>    
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn35" class="control-label">31. Trouble breathing <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror35"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn35" name="qn35" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete35();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn35" name="qn35" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete35();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>   
                            <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn36" class="control-label">32. Loss of menstrual periods <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror36"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn36" name="qn36" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete36();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn36" name="qn36" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete36();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">NA</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn36" name="qn36" class="wp-form-control wpcf7-radio" value="NA" onchange="return msgDelete36();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>   
                                <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn37" class="control-label">33. Irregular periods <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror37"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn37" name="qn37" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete37();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn37" name="qn37" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete37();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">NA</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn37" name="qn37" class="wp-form-control wpcf7-radio" value="NA" onchange="return msgDelete37();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>    
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn38" class="control-label">34. Excessive menstrual flow <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror38"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn38" name="qn38" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete38();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn38" name="qn38" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete38();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">NA</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn38" name="qn38" class="wp-form-control wpcf7-radio" value="NA" onchange="return msgDelete38();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>        
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn39" class="control-label">35. Have you ever been misscarried during the past two years ? <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror39"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn39" name="qn39" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete39();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn39" name="qn39" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete39();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">NA</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn39" name="qn39" class="wp-form-control wpcf7-radio" value="NA" onchange="return msgDelete39();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>          
                      <br><br>
                      
                           <div class="row">
                            <div class="col-md-2 col-sm-2"></div>
                            <div class="col-md-8 col-sm-8">
                              <label for="qn40" class="control-label">36. Pre menstrual syndrome/tension (PMS/PMT) <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-2 col-sm-2"></div>
                              </div>
                              <div class="row">
                              <div class="col-md-2 col-sm-2"></div>
                              <div class="col-md-2 col-sm-4">
                              <p id="perror40"></p>
                              </div>
                             </div>
                              <div class="row">
                               <div class="col-md-3 col-sm-4"></div>
                            <div class="col-md-0 col-sm-0">
                               <label for="yes" class="control-label">Yes</label>
                               </div>
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn40" name="qn40" class="wp-form-control wpcf7-radio" value="Yes" onchange="return msgDelete40();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">No</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn40" name="qn40" class="wp-form-control wpcf7-radio" value="No" onchange="return msgDelete40();">
                              </div>
                              
                              <div class="col-md-1 col-sm-0"></div>
                              <div class="col-md-0 col-sm-0">
                               <label for="no" class="control-label">NA</label>
                               </div>
                               
                               <div class="col-md-0 col-sm-1"> 
                              <input type="radio" id="qn40" name="qn40" class="wp-form-control wpcf7-radio" value="NA" onchange="return msgDelete40();">
                              </div>
                              
                              <div class="col-md-2 col-sm-2"></div>
                       
                      </div>                                                        
                      <br><br><br>
                                
                                                                                  
                          <div class="row">
                          <div class="col-md-4 col-sm-4"></div>             
                         <div class="col-md-4 ol-sm-4">
                         <button class="wpcf7-submit button--itzel" type="submit" onclick="return message();"><i class="button__icon fa fa-share" ></i><span>Analyse</span></button>  
                         </div>
                         
                         <div class="col-md-4 col-sm-4"></div>
                         </div>
                         <div class="row">
                         <div class="col-md-4 col-sm-4"></div> 
                         <div class="col-md-4 col-sm-4">
                              <p id="perror41"></p>
                              </div>
                         </div>
                        </form>
                      </div>                       
                      </div>
                    </div>
                  </div>
                  
                 </div>
             
              </div>
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
         		 con.close();	
	}
	
}
catch(Exception ex){
	out.println("Exception \n\n"+ex );
}

%>