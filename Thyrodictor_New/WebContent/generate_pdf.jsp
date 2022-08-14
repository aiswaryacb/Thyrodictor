<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.*"%>
<%@page import="java.awt.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>

<%
try {
Document document=new Document();
PdfWriter.getInstance(document,new FileOutputStream("G:/CCS/cb.pdf"));
document.open(); 
String name="Aiswarya C B";
String age="20";
document.add(new Paragraph("Hello "+name));
document.add(new Paragraph(age));
document.close(); 

//response.sendRedirect("generate_pdf.jsp");
}
catch (Exception e2) {
System.out.println(e2.getMessage());
}
%>

</body>
</html>