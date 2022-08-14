<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
session.setAttribute("user","");
session.getAttribute("user");
%>
<html>
    <head>
    <script type="text/javascript" src="js/jquery.js"></script>
    
    <script type="text/javascript" src="js/jquery.validate.js"></script>
    
    
        <title>Registration</title>
        <script>
            function Val(){
                if(document.getElementById("name").value==="")
                {
                    alert("Name is required");
                    return false;
                }
                else if(document.frm.gen[0].checked===false&&document.frm.gen[1].checked===false)
                {
                    alert("gender is required");
                    return false;
                }
                else if(document.getElementById("cou").value==="")
                {
                    alert("course is required");
                    return false;
                }
                else if(document.getElementById("branch").value==="")
                {
                    alert("Branch is required");
                    return false;
                }
                /*else if(document.getElementById("user").value==="")
                {
                    alert("Username is required");
                    return false;
                }*/
                else if(document.getElementById("pass").value==="")
                {
                    alert("Password is required");
                    return false;
                }
                return true;
            }
            
        </script>
    </head>
    <body>
        <center>
            <h1>Enter Your Details</h1>
            <br>
            <br>
            <br>
            <form name="frm" id="frm" action="Action_file_upload.jsp" method="post" enctype="multipart/form-data">
                Name :
                <input type="text" name="name1" id="name1">
                <br><br>
                Gender :
                Male<input type="radio" name="gen" id="gen" value="male">
                Female<input type="radio" name="gen" id="gen" value="female">
                <br><br>
                Image :
               
                <input type="file" name="ImageFile" id="ImageFile" required> 
                <br><br>
                Branch :
                <input type="text" name="branch" id="branch">
                <br><br>
                Phone :
                <input type="text" name="phn" id="phn">
                <br><br>
                Email : 
                <input type="email" name="mailid" id="mailid">
                <br><br> 
                <!--Username : 
                <input type="text" name="user" id="user">
                <br><br-->
                Password : 
                <input type="password" name="pass" id="pass">
                <br>
                <br>
                 
                <input type="submit" value="Submit" onclick="return Val()">
                <br><br>
                Already Have An Account? <a href="login.jsp">Login</a>
                
            </form>
        </center>
    </body>
</html>
