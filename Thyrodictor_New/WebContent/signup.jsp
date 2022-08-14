<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
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
     <title>Thyrodictor : Signup</title>

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
    <!-- script src="js/jquery.js"></script-->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/userValidation.js"></script>
<script src="js/doctor_signup.js"></script>
    <!--script  type="text/javascript" src="WebContent/js/patient.js"></script-->
   <script language="javascript" type="text/javascript">  
 var xmlHttp  
 var xmlHttp
function showState(str){ 
	 document.getElementById('perror7').innerHTML= "";
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
	 
 document.getElementById("pdistrict").innerHTML=xmlHttp.responseText
 }   
 }   
 
 
 var xmlHttp1  
 var xmlHttp1
function showState1(str1){ 
	 document.getElementById('derror77').innerHTML= "";
       if (typeof XMLHttpRequest != "undefined"){
   xmlHttp1= new XMLHttpRequest();
       }
       else if (window.ActiveXObject){
   xmlHttp1= new ActiveXObject("Microsoft.XMLHTTP");
       }
if (xmlHttp1==null){
    alert ("Browser does not support XMLHTTP Request")
return
} 
var url= "district1.jsp";
url += "?count1=" +str1;
xmlHttp1.onreadystatechange = stateChange1;
xmlHttp1.open("GET", url, true);
xmlHttp1.send(null);
}
 function stateChange1(){  
 
 if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete"){
	 
 document.getElementById("ddistrict").innerHTML=xmlHttp1.responseText
 }   
 }   

 
 var xmlHttp2  
 var xmlHttp2
function showState2(str2){ 
	 document.getElementById('lerror77').innerHTML= "";
       if (typeof XMLHttpRequest != "undefined"){
   xmlHttp2= new XMLHttpRequest();
       }
       else if (window.ActiveXObject){
   xmlHttp2= new ActiveXObject("Microsoft.XMLHTTP");
       }
if (xmlHttp2==null){
    alert ("Browser does not support XMLHTTP Request")
return
} 
var url= "district2.jsp";
url += "?count2=" +str2;
xmlHttp2.onreadystatechange = stateChange2;
xmlHttp2.open("GET", url, true);
xmlHttp2.send(null);
}
 function stateChange2(){  
 
 if (xmlHttp2.readyState==4 || xmlHttp2.readyState=="complete"){
	 
 document.getElementById("ldistrict").innerHTML=xmlHttp2.responseText
 }   
 }   
 </script>
 
    <script language="Javascript" type="text/javascript">

        function onlyAlphabets(e, t) {
            try {
            	document.getElementById('perror').innerHTML= "";
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
            	document.getElementById('perror6').innerHTML= "";
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
        
        
        
        function onlyAlphabets1(e, t) {
            try {
            	document.getElementById('derror').innerHTML= "";
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
        function onlyNumbers1(e, t) {
            try {
            	document.getElementById('derror66').innerHTML= "";
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
        function onlyNumbers2(e, t) {
            try {
            	document.getElementById('derror33').innerHTML= "";
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
            	document.getElementById('lerror').innerHTML= "";
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
        function onlyNumbers3(e, t) {
            try {
            	document.getElementById('lerror33').innerHTML= "";
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
        function onlyNumbers4(e, t) {
            try {
            	document.getElementById('lerror66').innerHTML= "";
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
        function patient_validate(){
        	var name=document.patient.pname.value;
        	var user_id=document.patient.puser_id.value;
        	var dob=document.patient.pdob.value;
        	var gender=document.patient.pgender.value;
        	var email=document.patient.pemail.value;
        	var phn=document.patient.pphn.value;
        	var state=document.patient.pstate.value;
        	var district=document.patient.pdistrict.value;
        	var password=document.patient.ppassword.value;
        	var flag=true;
        	
        	if(name==""|| name==null){
        		
        		fontcolor="red";
        		document.getElementById('perror').innerHTML= "<span style=\"color:red\">Enter Your Name </span>";
        		flag=false;
        		//return false;
        	}
        	else if(name.length<3){
        		fontcolor="red";
        		document.getElementById('perror').innerHTML= "<span style=\"color:red\">Minimum 3 characters </span>";
        		//alert("minnn");
        		//return false;
        		flag=false;
        	}
        	else if(name.length>20){
        		fontcolor="red";
        		document.getElementById('perror').innerHTML= "<span style=\"color:red\">Maximum 20 characters </span>";
        		//alert("minnn");
        		flag=false;
        		//return false;
        	}
        	
        	
if(user_id==""|| user_id==null){
        		
        		fontcolor="red";
        		document.getElementById('perror2').innerHTML= "<span style=\"color:red\">User ID is Required </span>";
        		flag=false;
        		//return false;
        	}

if(dob==""|| dob==null){
	
	fontcolor="red";
	document.getElementById('perror3').innerHTML= "<span style=\"color:red\">DOB is Required </span>";
	flag=false;
	//return false;
}
if(gender==""|| gender==null){
	
	fontcolor="red";
	document.getElementById('perror4').innerHTML= "<span style=\"color:red\">Gender is Required </span>";
	flag=false;
	//return false;
}
else if(gender=="S")
	{
	fontcolor="red";
	document.getElementById('perror4').innerHTML= "<span style=\"color:red\">Select Your gender </span>";
	flag=false;
	//return false;
	}
if(email==""|| email==null){
	
	fontcolor="red";
	document.getElementById('perror5').innerHTML= "<span style=\"color:red\">Email is Required </span>";
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
	document.getElementById('perror6').innerHTML= "<span style=\"color:red\">Enter Your Phone Number </span>";
	flag=false;
	//return false;
}
else if(phn.length!=10){
	fontcolor="red";
	document.getElementById('perror6').innerHTML= "<span style=\"color:red\">Phone Number should be 10 digits </span>";
	//alert("minnn");
	flag=false;
	//return false;
}
if(state==""|| state==null){
	
	fontcolor="red";
	document.getElementById('perror7').innerHTML= "<span style=\"color:red\">Select Your State </span>";
	flag=false;
	//return false;
}
else if(state=="none")
{
fontcolor="red";
document.getElementById('perror7').innerHTML= "<span style=\"color:red\">Select Your State </span>";
flag=false;
//return false;
}
if(district==""|| district==null){
	
	fontcolor="red";
	document.getElementById('perror8').innerHTML= "<span style=\"color:red\">Select Your District </span>";
	flag=false;
	//return false;
}
else if(district=="none1")
{
fontcolor="red";
document.getElementById('perror8').innerHTML= "<span style=\"color:red\">Select Your District </span>";
flag=false;
//return false;
}
else if(district=="-1")
{
fontcolor="red";
document.getElementById('perror88').innerHTML= "<span style=\"color:red\">Select Your District </span>";

flag= false;
}
if(password==""|| password==null){
	
	fontcolor="red";
	document.getElementById('perror9').innerHTML= "<span style=\"color:red\">Enter Password </span>";
	flag=false;
	//return false;
}
else if(password.length<8){
	fontcolor="red";
	document.getElementById('perror9').innerHTML= "<span style=\"color:red\">Minimum 8 characters </span>";
	//alert("minnn");
	flag=false;
	//return false;
}
else if(password.length>20){
	fontcolor="red";
	document.getElementById('perror9').innerHTML= "<span style=\"color:red\">Maximum 20 characters </span>";
	//alert("minnn");
flag=false;
	//return false;
}
if(flag==false){
	return false;
}

else{
	return true;
	}

        	
        }
    
        
        /*function msgDelete22()
        {
        	document.getElementById('derror22').innerHTML= "";
        }*/
        function msgDelete33()
        {
        	document.getElementById('derror33').innerHTML= "";
        }
        function msgDelete44()
        {
        	document.getElementById('derror44').innerHTML= "";
        }
        function msgDelete55()
        {
        	document.getElementById('derror55').innerHTML= "";
        }
        function msgDelete77()
        {
        	document.getElementById('derror77').innerHTML= "";
        }
        function msgDelete88()
        {
        	document.getElementById('derror88').innerHTML= "";
        }
        function msgDelete99()
        {
        	document.getElementById('derror99').innerHTML= "";
        }
        function msgDelete100()
        {
        	document.getElementById('derror100').innerHTML= "";
        }
        
        
        function doctor_validate(){
        	var name=document.doctor.dname.value;
        	//var photo=document.doctor.dphoto.value;
        	var reg=document.doctor.dreg.value;
        	var gender=document.doctor.dgender.value;
        	var email=document.doctor.demail.value;
        	var phn=document.doctor.dphn.value;
        	var state=document.doctor.dstate.value;
        	var district=document.doctor.ddistrict.value;
        	var user_id=document.doctor.duser_id.value;
        	var password=document.doctor.dpassword.value;
        	var flag=true;
        	if(name==""|| name==null){
        		
        		fontcolor="red";
        		document.getElementById('derror').innerHTML= "<span style=\"color:red\">Enter Your Name </span>";
        		flag=false;
        		//return false;
        	}
        	else if(name.length<3){
        		fontcolor="red";
        		document.getElementById('derror').innerHTML= "<span style=\"color:red\">Minimum 3 characters </span>";
        		//alert("minnn");
        		flag= false;
        	}
        	else if(name.length>20){
        		fontcolor="red";
        		document.getElementById('derror').innerHTML= "<span style=\"color:red\">Maximum 20 characters </span>";
        		//alert("minnn");
        		flag= false;
        	}
        	
        	
/*if(photo==""|| photo==null){
        		
        		fontcolor="red";
        		document.getElementById('derror22').innerHTML= "<span style=\"color:red\">Photo is Required </span>";
        		
        		flag= false;
        	}
*/
	
if(reg==""|| reg==null){
	
	fontcolor="red";
	document.getElementById('derror33').innerHTML= "<span style=\"color:red\">Register Number is Required </span>";
	
	flag= false;
}
else if(reg.length!=5){
	fontcolor="red";
	document.getElementById('derror33').innerHTML= "<span style=\"color:red\">Register Number should be 5 digits </span>";
	//alert("minnn");
	flag= false;
}
if(gender==""|| gender==null){
	
	fontcolor="red";
	document.getElementById('derror44').innerHTML= "<span style=\"color:red\">Gender is Required </span>";
	
	flag= false;
}
else if(gender=="S")
	{
	fontcolor="red";
	document.getElementById('derror44').innerHTML= "<span style=\"color:red\">Select Your gender </span>";
	
	flag= false;
	}
if(email==""|| email==null){
	
	fontcolor="red";
	document.getElementById('derror55').innerHTML= "<span style=\"color:red\">Email is Required </span>";
	
	flag= false;
}
//for(int i=0;i<email.length;i++)
	//{
	//while(email.charAt(i)!='@')
		//{
		//fontcolor="red";
		//document.getElementById('perror5').innerHTML= "<span style=\"color:red\">Enter a valid email id </span>";
		
		//flag= false;
		//}
	//}
if(phn==""|| phn==null){
	
	fontcolor="red";
	document.getElementById('derror66').innerHTML= "<span style=\"color:red\">Enter Your Phone Number </span>";
	
	flag= false;
}
else if(phn.length!=10){
	fontcolor="red";
	document.getElementById('derror66').innerHTML= "<span style=\"color:red\">Phone Number should be 10 digits </span>";
	//alert("minnn");
	flag= false;
}
if(state==""|| state==null){
	
	fontcolor="red";
	document.getElementById('derror77').innerHTML= "<span style=\"color:red\">Select Your State </span>";
	
	flag= false;
}
else if(state=="none")
{
fontcolor="red";
document.getElementById('derror77').innerHTML= "<span style=\"color:red\">Select Your State </span>";

flag= false;
}
if(district==""|| district==null){
	
	fontcolor="red";
	document.getElementById('derror88').innerHTML= "<span style=\"color:red\">Select Your District </span>";
	
	flag= false;
}
else if(district=="none1")
{
fontcolor="red";
document.getElementById('derror88').innerHTML= "<span style=\"color:red\">Select Your District </span>";

flag= false;
}
else if(district==-1)
{
fontcolor="red";
document.getElementById('derror88').innerHTML= "<span style=\"color:red\">Select Your District </span>";

flag= false;
}
if(user_id==""|| user_id==null){
	
	fontcolor="red";
	document.getElementById('derror100').innerHTML= "<span style=\"color:red\">Enter User ID </span>";
	
	flag= false;
}
if(password==""|| password==null){
	
	fontcolor="red";
	document.getElementById('derror99').innerHTML= "<span style=\"color:red\">Enter Password </span>";
	
	flag= false;
}
else if(password.length<8){
	fontcolor="red";
	document.getElementById('derror99').innerHTML= "<span style=\"color:red\">Minimum 8 characters </span>";
	//alert("minnn");
	flag= false;
}
else if(password.length>20){
	fontcolor="red";
	document.getElementById('derror99').innerHTML= "<span style=\"color:red\">Maximum 20 characters </span>";
	//alert("minnn");
	flag= false;
}

if(flag==false){
	return false;
}
else{
	return true;
	}

        	
        }
        
        
 
        function msgDelete222()
        {
        	document.getElementById('lerror22').innerHTML= "";
        }
        function msgDelete333()
        {
        	document.getElementById('lerror33').innerHTML= "";
        }
        function msgDelete444()
        {
        	document.getElementById('lerror44').innerHTML= "";
        }
        function msgDelete555()
        {
        	document.getElementById('lerror55').innerHTML= "";
        }
        function msgDelete777()
        {
        	document.getElementById('lerror77').innerHTML= "";
        }
        function msgDelete888()
        {
        	document.getElementById('lerror88').innerHTML= "";
        }
        function msgDelete999()
        {
        	document.getElementById('lerror99').innerHTML= "";
        }
        function msgDelete1000()
        {
        	document.getElementById('lerror100').innerHTML= "";
        }

        
        
        function lab_validate(){
        	var name=document.lab.lname.value;
        	//var photo=document.lab.dphoto.value;
        	var reg=document.lab.lreg.value;
        	//var gender=document.lab.lgender.value;
        	var from=document.lab.time_from.value;
        	var to=document.lab.time_to.value;
        	var email=document.lab.lemail.value;
        	var phn=document.lab.lphn.value;
        	var state=document.lab.lstate.value;
        	var district=document.lab.ldistrict.value;
        	var password=document.lab.lpassword.value;
        	var user_id=document.lab.luser_id.value;
        	var flag=true;
        	if(name==""|| name==null){
        		
        		fontcolor="red";
        		document.getElementById('lerror').innerHTML= "<span style=\"color:red\">Enter Lab Name </span>";
        		
        		flag = false;
        	}
        	else if(name.length<3){
        		fontcolor="red";
        		document.getElementById('lerror').innerHTML= "<span style=\"color:red\">Minimum 3 characters </span>";
        		//alert("minnn");
        		flag = false;
        	}
        	else if(name.length>20){
        		fontcolor="red";
        		document.getElementById('lerror').innerHTML= "<span style=\"color:red\">Maximum 20 characters </span>";
        		//alert("minnn");
        		flag = false;
        	}
        	
        	
/*if(photo==""|| photo==null){
        		
        		fontcolor="red";
        		document.getElementById('lerror22').innerHTML= "<span style=\"color:red\">Photo is Required </span>";
        		
        		flag = false;
        	}
*/
	
if(reg==""|| reg==null){
	
	fontcolor="red";
	document.getElementById('lerror33').innerHTML= "<span style=\"color:red\">Register Number is Required </span>";
	
	flag = false;
}
else if(reg.length!=5){
	fontcolor="red";
	document.getElementById('lerror33').innerHTML= "<span style=\"color:red\">Register Number should be 5 digits </span>";
	//alert("minnn");
	flag = false;
}
if(from==""|| from==null){
	
	fontcolor="red";
	document.getElementById('lerror44').innerHTML= "<span style=\"color:red\">Time is Required </span>";
	
	flag = false;
}
if(to==""|| to==null)
	{
	fontcolor="red";
	document.getElementById('lerror22').innerHTML= "<span style=\"color:red\">Time is Required </span>";
	
	flag = false;
	}
if(email==""|| email==null){
	
	fontcolor="red";
	document.getElementById('lerror55').innerHTML= "<span style=\"color:red\">Email is Required </span>";
	
	flag = false;
}
//for(int i=0;i<email.length;i++)
	//{
	//while(email.charAt(i)!='@')
		//{
		//fontcolor="red";
		//document.getElementById('perror5').innerHTML= "<span style=\"color:red\">Enter a valid email id </span>";
		
		//flag = false;
		//}
	//}
if(phn==""|| phn==null){
	
	fontcolor="red";
	document.getElementById('lerror66').innerHTML= "<span style=\"color:red\">Enter Your Phone Number </span>";
	
	flag = false;
}
else if(phn.length!=10){
	fontcolor="red";
	document.getElementById('lerror66').innerHTML= "<span style=\"color:red\">Phone Number should be 10 digits </span>";
	//alert("minnn");
	flag = false;
}
if(state==""|| state==null){
	
	fontcolor="red";
	document.getElementById('lerror77').innerHTML= "<span style=\"color:red\">Select Your State </span>";
	
	flag = false;
}
else if(state=="none")
{
fontcolor="red";
document.getElementById('lerror77').innerHTML= "<span style=\"color:red\">Select Your State </span>";

flag = false;
}
if(district==""|| district==null){
	
	fontcolor="red";
	document.getElementById('lerror88').innerHTML= "<span style=\"color:red\">Select Your District </span>";
	
	flag = false;
}
else if(district=="none1")
{
fontcolor="red";
document.getElementById('lerror88').innerHTML= "<span style=\"color:red\">Select Your District </span>";

flag = false;
}
else if(district==-1)
{
fontcolor="red";
document.getElementById('lerror88').innerHTML= "<span style=\"color:red\">Select Your District </span>";

flag= false;
}
if(user_id==""|| user_id==null){
	
	fontcolor="red";
	document.getElementById('lerror100').innerHTML= "<span style=\"color:red\">Enter User ID </span>";
	
	flag = false;
}
if(password==""|| password==null){
	
	fontcolor="red";
	document.getElementById('lerror99').innerHTML= "<span style=\"color:red\">Enter Password </span>";
	
	flag = false;
}
else if(password.length<8){
	fontcolor="red";
	document.getElementById('lerror99').innerHTML= "<span style=\"color:red\">Minimum 8 characters </span>";
	//alert("minnn");
	flag = false;
}
else if(password.length>20){
	fontcolor="red";
	document.getElementById('lerror99').innerHTML= "<span style=\"color:red\">Maximum 20 characters </span>";
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
                <li><a href="index.html">Home</a></li>
                <li class="active"><a href="signup.jsp"><span class="glyphicon glyphicon-user"></span> Signup</a></li>
                <li><a href="login.jsp?status="><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
              </ul>           
            </div><!--/.nav-collapse -->
          </div>     
        </nav>  
      </div>
      <!-- END MENU -->    
    </header>
    <!--=========== END HEADER SECTION ================-->       
    <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor","root","root");  
 Statement stmt = con.createStatement(); 
 %>
    <section id="blogArchive">      
      <div class="row">
        <div class="col-lg-12 col-md-12">
          <div class="blog-breadcrumbs-area">
            <div class="container">
              <div class="blog-breadcrumbs-left">
                <h2>Signup Here !!!</h2>
              </div>
              <div class="blog-breadcrumbs-right">
                <ol class="breadcrumb">
                  <li>You are here</li>
                  <li><a href="index.html">Home</a></li>                  
                  <li class="active">Signup</li>
                </ol>
              </div>
            </div>
          </div>
        </div>        
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
              <h5>New User can sign up here !!!</h5>
    
   <div class="readmore_area" align="right">
                <a data-toggle="modal" data-target="#myModal-1" href="#" data-hover="Patient Signup"><span>Patient Signup</span></a>    
              </div>
              <!-- start modal window -->
              <div class="modal fade" id="myModal-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-1" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="myModalLabel-1">Signup Details</h4>
                    </div>
                    <div class="modal-body">
                      <div class="appointment-area">
                        <form class="appointment-form" method="post" id="patient" name="patient" action="patient_signup_db.jsp" onsubmit="return patient_validate();">
                          <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <label for="pname" class="control-label">Your name <span class="required">*</span>
                              </label>
                              <input type="text" id="pname" name="pname" class="wp-form-control wpcf7-text" placeholder="Your name"   onchange="return onlyAlphabets(event,this);" onkeypress="return onlyAlphabets(event,this);">                            <br>
                            <p id="perror"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label  for="puser_id" class="control-label">Your User ID <span class="required">*</span>
                              </label>
                              <input type="text" id="puser_id" name="puser_id" class="wp-form-control wpcf7-text" placeholder="Your User ID" onchange="return msgDelete2();">  
                              <br>
                              <p id="perror2"></p>
                            </div>
                          </div>
                          
                          
                           <div class="row">
                           <div class="col-md-6 col-sm-6">
                              <label for="pdob" class="control-label">Your Birth <span class="required">*</span>
                              </label>
                              <input type="date" id="pdob" name="pdob" class="wp-form-control wpcf7-date" onchange="return msgDelete3();">
                              <br>
                              <p id="perror3"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label for="pgender" class="control-label">Your Gender <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-6 col-sm-6">
                              <select id="pgender" name="pgender" class="wp-form-control wpcf7-select" onchange="return msgDelete4();">
                              	<option value="S">~select~</option>
                                <option value="F">Female</option>
                                <option value="M">Male</option>
                                
                              </select> 
                              <p id="perror4"></p>
                            </div>
                            
                          </div>
                          
                          
                          <div class="row">
                             <div class="col-md-6 col-sm-6">
                              <label for="pemail" class="control-label">Your Email <span class="required">*</span>
                              </label>
                              <input type="email" id="pemail" name="pemail" class="wp-form-control wpcf7-email" placeholder="Email address" oninput="return msgDelete5();"> 
                              <br> 
                              <p id="perror5"></p>
                            </div>                           
                             <div class="col-md-6 col-sm-6">
                              <label for="pphn" class="control-label">Your Phone <span class="required">*</span>
                              </label>
                              <input type="text" id="pphn" name="pphn" class="wp-form-control wpcf7-text" placeholder="Phone No" onkeypress="return onlyNumbers(event,this);" onchange="return onlyNumbers(event,this);">  
                            <br>
                            <p id="perror6"></p>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <label for="pstate" class="control-label">Select State <span class="required">*</span>
                              </label>
                               <select name='pstate' onchange="showState(this.value)" class="wp-form-control wpcf7-select">  
  <option value="none">State</option>  
  <%
 ResultSet rs = stmt.executeQuery("Select * from state;");
 while(rs.next()){
     %>
     
 <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
 <%
 }
     %>
      
 </select>
 <br>
 <p id="perror7"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label for="pdistrict" class="control-label">Select District <span class="required">*</span>
                              </label>
                              <select id="pdistrict" name="pdistrict" class="wp-form-control wpcf7-select" onchange="return msgDelete8();">
                              <option value="none1">District</option>
                                
                              </select>
                              <br>
                              <p id="perror8"></p> 
                            </div>                          
                            </div>   
                            <div class="row">
                            
                            <div class="col-md-6 col-sm-6">
                              <!--label class="control-label">Select User Type <span class="required">*</span>
                              </label>
                              <select class="wp-form-control wpcf7-select">
                                <option val="1">Patient</option>
                                <option val="2">Doctor</option>
                                <option val="3">Lab</option> 
                                
                              </select--> 
                              <label for="ppassword" class="control-label">Password <span class="required">*</span></label>
                              <input type="password" id="ppassword" name="ppassword" class="wp-form-control wpcf7-text" placeholder="********" onkeypress="return msgDelete9();">
                              <br>
                              <p id="perror9"></p> 
                            </div>
                                                      
                            </div>             
                             
                          <!-- input type="text" class="wp-form-control wpcf7-text" placeholder="Subject">
                          <textarea class="wp-form-control wpcf7-textarea" cols="30" rows="10" placeholder="What would you like to tell us"></textarea!-->
                         <button class="wpcf7-submit button--itzel" type="submit"><i class="button__icon fa fa-share"></i><span>Signup</span></button>  
                        </form>
                      </div>
                    </div>                    
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div><!-- /.modal -->
              
              
             <div class="readmore_area" align="right">
                <a data-toggle="modal" data-target="#myModal-2" href="#" data-hover="Doctor Signup"><span>Doctor Signup</span></a>    
              </div>
              <!-- start modal window -->
              <div class="modal fade" id="myModal-2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-2" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="myModalLabel-2">Signup Details</h4>
                    </div>
                    <div class="modal-body">
                      <div class="appointment-area">
                        <form class="appointment-form" id="doctor" name="doctor" action="doctor_signup_db.jsp" method="post" onsubmit="return doctor_validate();">
                          <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <label for="dname" class="control-label">Your name <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-6 col-sm-6">
                              <input type="text" id="dname" name="dname" class="wp-form-control wpcf7-text" placeholder="Your name" onkeypress="return onlyAlphabets1(event,this);" onchange="return onlyAlphabets1(event,this);" >
                           	<br>
                           	<p id="derror"></p>
                            </div>
                            
                            <!-- div class="col-md-6 col-sm-6">
                              <label for="dphoto" class="control-label">Upload Photo <span class="required">*</span>
                              </label>
                              <input type="file" id="dphoto" name="dphoto" class="wp-form-control wpcf7-file" placeholder="Upload Photo" onchange="return msgDelete22();">  
                              <br>
                              <p id="derror22"></p>
                            </div-->
                          </div>
                          
                          
                           <div class="row">
                           <div class="col-md-6 col-sm-6">
                              <label for="dreg" class="control-label">Your Register Number<span class="required" >*</span>
                              </label>
                              <input type="text" id="dreg" name="dreg" class="wp-form-control wpcf7-text" placeholder="Your Register Number" onkeypress="return onlyNumbers2(event,this);" onchange="return onlyNumbers2(event,this);">
                              <br>
                              <p id="derror33"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label for="dgender" class="control-label">Your Gender <span class="required">*</span>
                              </label>
                              </div>
                              <div class="col-md-6 col-sm-6">
                              <select id="dgender" name="dgender" class="wp-form-control wpcf7-select" onchange="return msgDelete44();">
                              	<option value="S">~select~</option>
                                <option value="F">Female</option>
                                <option value="M">Male</option>
                                
                              </select>
                              <p id="derror44"></p>
                              <br> 
                              
                              </div>
                            
                            
                          </div>
                          
                          
                          <div class="row">
                             <div class="col-md-6 col-sm-6">
                              <label for="demail" class="control-label">Your Email <span class="required">*</span>
                              </label>
                              <input type="email" id="demail" name="demail" class="wp-form-control wpcf7-email" placeholder="Email address" oninput="return msgDelete55();">  
                             <br>
                             <p id="derror55"></p> 
                            </div>                         
                               <div class="col-md-6 col-sm-6">
                              <label for="dphn" class="control-label">Your Phone <span class="required">*</span>
                              </label>
                              <input type="text" id="dphn" name="dphn" class="wp-form-control wpcf7-text" placeholder="Phone No" onkeypress="return onlyNumbers1(event,this);" onchange="return onlyNumbers1(event,this);">  
								<br>
								<p id="derror66"></p>                           
                            </div>
                          </div>
                       <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <label for="dstate" class="control-label">Select State <span class="required">*</span>
                              </label>
                               <select name='dstate' onchange="showState1(this.value)" class="wp-form-control wpcf7-select">  
  <option value="none">State</option>  
  <%
 ResultSet rs1 = stmt.executeQuery("Select * from state;");
 while(rs1.next()){
     %>
 <option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>  
 <%
 
 }
     %>
      
 </select>
 <br>
 <p id="derror77"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label for="ddistrict" class="control-label">Select District <span class="required">*</span>
                              </label>
                              <select id="ddistrict" name="ddistrict" class="wp-form-control wpcf7-select" onchange="return msgDelete88();">
                              <option value="none">District</option>
                                
                              </select> 
                              <br>
                               <p id="derror88"></p> 
                            </div>                          
                            </div>      
                            <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <!-- label class="control-label">Select User Type <span class="required">*</span>
                              </label>
                              <select class="wp-form-control wpcf7-select">
                                <option val="1">Patient</option>
                                <option val="2">Doctor</option>
                                <option val="3">Lab</option> 
                                
                              </select--> 
                              <label for="duser_id" class="control-label">User ID <span class="required">*</span></label>
                              <input type="text" id="duser_id" name="duser_id" class="wp-form-control wpcf7-text" placeholder="User ID" onkeypress="return msgDelete100();"> 
                               <br>
                               <p id="derror100"></p> 
                            </div> 
                            <div class="col-md-6 col-sm-6">
                              <!-- label class="control-label">Select User Type <span class="required">*</span>
                              </label>
                              <select class="wp-form-control wpcf7-select">
                                <option val="1">Patient</option>
                                <option val="2">Doctor</option>
                                <option val="3">Lab</option> 
                                
                              </select--> 
                              <label for="dpassword" class="control-label">Password <span class="required">*</span></label>
                              <input type="password" id="dpassword" name="dpassword" class="wp-form-control wpcf7-text" placeholder="********" onkeypress="return msgDelete99();"> 
                               <br>
                               <p id="derror99"></p> 
                            </div>                          
                            </div>             
                             
                          <!-- input type="text" class="wp-form-control wpcf7-text" placeholder="Subject">
                          <textarea class="wp-form-control wpcf7-textarea" cols="30" rows="10" placeholder="What would you like to tell us"></textarea!-->
                         <button class="wpcf7-submit button--itzel" type="submit"><i class="button__icon fa fa-share"></i><span>Signup</span></button>  
                        </form>
                      </div>
                    </div>                    
                  </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
              </div><!-- /.modal -->
              
              
              
            <div class="readmore_area" align="right">
                <a data-toggle="modal" data-target="#myModal-3" href="#" data-hover="Lab Signup"><span>&nbsp;&nbsp;&nbsp;&nbsp;Lab Signup&nbsp;&nbsp;&nbsp;&nbsp;</span></a>    
              </div>
              <!-- start modal window -->
              <div class="modal fade" id="myModal-3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-3" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="myModalLabel-3">Signup Details</h4>
                    </div>
                    <div class="modal-body">
                      <div class="appointment-area">
                        <form class="appointment-form" id="lab" name="lab" method="post" action="lab_signup_dp.jsp" onsubmit="return lab_validate();">
                          <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <label for="lname" class="control-label">Lab name <span class="required">*</span>
                              </label>
                              <input type="text" id="lname" name="lname" class="wp-form-control wpcf7-text" placeholder="Lab name" onkeypress="return onlyAlphabets2(event,this);" onchange="return onlyAlphabets2(event,this);" >
                              <br>
                              	<p id="lerror"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                             <label for="lreg" class="control-label">Lab Register Number <span class="required">*</span>
                              </label>
                              <input type="text" id="lreg" name="lreg" class="wp-form-control wpcf7-text"  placeholder="Lab Register Number" onkeypress="return onlyNumbers3(event,this);" onchange="return onlyNumbers3(event,this);">  
                            <br>
                            <p id="lerror33"></p>
                            </div>
                          </div>
                          
                          
                           <div class="row">
                           <div class="col-md-6 col-sm-6">
                              <label for="time_from" class="control-label">Lab Timings From :  <span class="required">*</span>
                              </label>
                              <input type="time" id="time_from" name="time_from" class="wp-form-control wpcf7-text" onchange="return msgDelete444();">
                            <br>
                            <p id="lerror44"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label for="time_to" class="control-label">To :  <span class="required">*</span>
                              </label>
                              <input type="time" id="time_to" name="time_to" class="wp-form-control wpcf7-text" onchange="return msgDelete222();">
                               <br>
                            <p id="lerror22"></p>
                              </div>
                            </div>
                            
                          
                          
                          
                          <div class="row">
                             <div class="col-md-6 col-sm-6">
                              <label for="lemail" class="control-label">Your Email <span class="required">*</span>
                              </label>
                              <input type="email" id="lemail" name="lemail" class="wp-form-control wpcf7-email" placeholder="Email address" onchange="return msgDelete555();">  
                             <br>
                            <p id="lerror55"></p>
                            </div>                       
                                 <div class="col-md-6 col-sm-6">
                              <label for="lphn" class="control-label">Your Phone <span class="required">*</span>
                              </label>
                              <input type="text" id="lphn" name="lphn" class="wp-form-control wpcf7-text" placeholder="Phone No" onkeypress="return onlyNumbers4(event,this);" onchange="return onlyNumbers4(event,this);">  
                               <br>
                            <p id="lerror66"></p>
                            </div>
                          </div>
                         <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <label for="lstate" class="control-label">Select State <span class="required">*</span>
                              </label>
                               <select name='lstate' onchange="showState2(this.value)" class="wp-form-control wpcf7-select">  
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
 <p id="lerror77"></p>
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <label for="ldistrict" class="control-label">Select District <span class="required">*</span>
                              </label>
                              <select id="ldistrict" name="ldistrict" class="wp-form-control wpcf7-select">
                              <option value="none">District</option>
                                
                              </select> 
                              <br>
 							<p id="lerror88"></p>
                            </div>                          
                            </div>   
                            <div class="row">
                            <div class="col-md-6 col-sm-6">
                              <!-- >label class="control-label">Select User Type <span class="required">*</span>
                              </label>
                              <select class="wp-form-control wpcf7-select">
                                <option val="1">Patient</option>
                                <option val="2">Doctor</option>
                                <option val="3">Lab</option> 
                                
                              </select--> 
                              <label for="luser_id" class="control-label">User ID <span class="required">*</span></label>
                              <input type="text" id="luser_id" name="luser_id" class="wp-form-control wpcf7-text" placeholder="User ID" onkeypress="return msgDelete1000();"> 
                              <br>
 							<p id="lerror100"></p>
                              </div>    
                            
                            <div class="col-md-6 col-sm-6">
                              <!-- >label class="control-label">Select User Type <span class="required">*</span>
                              </label>
                              <select class="wp-form-control wpcf7-select">
                                <option val="1">Patient</option>
                                <option val="2">Doctor</option>
                                <option val="3">Lab</option> 
                                
                              </select--> 
                              <label for="lpassword" class="control-label">Password <span class="required">*</span></label>
                              <input type="password" id="lpassword" name="lpassword" class="wp-form-control wpcf7-text" placeholder="********" onkeypress="return msgDelete999();"> 
                              <br>
 							<p id="lerror99"></p>
                              </div>                          
                              
                            
                            
                           <div class="col-md-6 col-sm-6">
                              
                            </div>
                            <div class="col-md-6 col-sm-6">
                              <!--label for="time_to" class="control-label">To :  <span class="required">*</span>
                              </label>
                              <input type="time" id="time_to" name="time_to" class="wp-form-control wpcf7-text"-->
                              </div>
                            </div>         
                             
                          <!-- input type="text" class="wp-form-control wpcf7-text" placeholder="Subject">
                          <textarea class="wp-form-control wpcf7-textarea" cols="30" rows="10" placeholder="What would you like to tell us"></textarea!-->
                         <button class="wpcf7-submit button--itzel" type="submit"><i class="button__icon fa fa-share"></i><span>Signup</span></button>  
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