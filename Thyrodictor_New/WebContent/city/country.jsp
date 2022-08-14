<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
 <html>
 <head>  
 <script language="javascript" type="text/javascript">  
 var xmlHttp  
 var xmlHttp
function showState(str){ 
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
var url= "city.jsp";
url += "?count=" +str;
xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
 function stateChange(){   
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
 document.getElementById("state").innerHTML=xmlHttp.responseText   
 }   
 }   
 </script>  
 </head>  
 <body> 
 <center> 
 <select name='country' onchange="showState(this.value)">  
  <option value="none">Country</option>  
  <%
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor","root","root");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from state;");
 while(rs.next()){
     %>
 <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>  
 <%
 }
     %>
      
 </select>  
 <br>
     
    
 <div id='state'>  
 <select name='state' >  
 <option value='-1'>City</option>  
 </select>
 </center>  
 </div>  
 </body> 
 </html>