<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="backup.*" %>
<meta http-equiv="Refresh" content="0;url=admin_home.jsp">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<%
restoreSqltoDb obj = new restoreSqltoDb();
boolean res = obj.Restoredbfromsql("backup.sql");
if(res){
	%>
	<script>alert("Restored successfully");</script>
	<%
	
}
else{
	%>
	<script>alert("Restoring failed!");</script>
	<%
}
%>
</head>
</html>