<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" import ="java.sql.*" %>
 <%  
 String state=request.getParameter("count"); 
 String buffer="<select name='State'><option value='-1'>City</option>"; 
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor","root","root");  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from state where state_id='"+state+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(3)+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer);  
 %>
 