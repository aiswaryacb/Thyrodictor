<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
 <%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta http-equiv="Refresh" content="0;url=lab_test_reports.jsp">
  <head>
    <%
try{
	
	String un =(String)session.getAttribute("lab");
    if(un==""){response.sendRedirect("login.jsp");}
    String userid=request.getParameter("userid");
    String tsh = request.getParameter("tsh");
	String t3 = request.getParameter("t3");
	String t4 = request.getParameter("t4");
	String height = request.getParameter("height");
	String weight = request.getParameter("weight");
	String result="";
	/*DateFormat dateF = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date date1 = new java.util.Date();
    date1 = new java.util.Date();
    String today = dateF.format(date1);*/
    
	Connection con=null;
	Statement stmt=null;
	String connectionURL= "jdbc:mysql://localhost:3306/test"; 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
	if(!con.isClosed()){
		stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select * FROM patient_details where patient_user_id='"+userid+"'");
		rs.next();
		String patient_id=rs.getString(1);
		String gender=rs.getString(3);
		String dob=rs.getString(4);
		int yearDOB = Integer.parseInt(dob.substring(0, 4));
        int monthDOB = Integer.parseInt(dob.substring(5, 7));
        int dayDOB = Integer.parseInt(dob.substring(8, 10));

        DateFormat dateFormat = new SimpleDateFormat("yyyy");
        java.util.Date date = new java.util.Date();
        int thisYear = Integer.parseInt(dateFormat.format(date));

        dateFormat = new SimpleDateFormat("MM");
        date = new java.util.Date();
        int thisMonth = Integer.parseInt(dateFormat.format(date));

        dateFormat = new SimpleDateFormat("dd");
        date = new java.util.Date();
        int thisDay = Integer.parseInt(dateFormat.format(date));

        int age = thisYear - yearDOB;


        if (thisMonth < monthDOB) {
            age = age - 1; 
    }

      if (thisMonth == monthDOB && thisDay < dayDOB) {
            age = age - 1;
    }
     dateFormat = new SimpleDateFormat("yyyy-MM-dd");
     date = new java.util.Date();
     String today = dateFormat.format(date);
     //String today= date.toString();
     String age_str=new Integer(age).toString();
		
     double _tsh = Double.parseDouble(tsh);
     double _t3 = Double.parseDouble(t3);
     double _t4 = Double.parseDouble(t4);
     //out.println("b4 if \n");
    // String female="F";
     //String male="M";
	    if(age<2){
			 if(gender.equals("F")){
				 ResultSet rs1=stmt.executeQuery("SELECT * FROM `normal_values` WHERE normal_values_id='1'");
				 rs1.next();
				 double tsh_min=Double.parseDouble(rs1.getString(4));
				 double tsh_max=Double.parseDouble(rs1.getString(5));
				 double t3_min=Double.parseDouble(rs1.getString(6));
				 double t3_max=Double.parseDouble(rs1.getString(7));
				 double t4_min=Double.parseDouble(rs1.getString(8));
				 double t4_max=Double.parseDouble(rs1.getString(9));
				 if(_tsh < tsh_min || _t3 > t3_max || _t4 > t4_max){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hyperthyroidism');");
					    //response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
					    %><script>alert("Hyper Thyroidism")</script><%
					    result="Hyper Thyroidism";
					   // response.sendRedirect("lab_test_reports.jsp");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    //response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
					    %><script>alert("Hypo Thyroidism")</script><%
					    result="Hypo Thyroidism";
					    //response.sendRedirect("lab_test_reports.jsp");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					   // response.sendRedirect("patient_test_results.jsp?result=normal");
					    %><script>alert("Normal")</script><%
					    result="Normal";
					    //response.sendRedirect("lab_test_reports.jsp");

				 }
			 }
			 else{
				 ResultSet rs1=stmt.executeQuery("SELECT * FROM `normal_values` WHERE normal_values_id='2'");
				 rs1.next();
				 double tsh_min=Double.parseDouble(rs1.getString(4));
				 double tsh_max=Double.parseDouble(rs1.getString(5));
				 double t3_min=Double.parseDouble(rs1.getString(6));
				 double t3_max=Double.parseDouble(rs1.getString(7));
				 double t4_min=Double.parseDouble(rs1.getString(8));
				 double t4_max=Double.parseDouble(rs1.getString(9));
				 if(_tsh < tsh_min || _t3 > t3_max || _t4 > t4_max){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hyperthyroidism');");
					//    response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
					    %><script>alert("Hyper Thyroidism")</script><%
					    result="Hyper Thyroidism";
					    //response.sendRedirect("lab_test_reports.jsp");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    //response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
					    %><script>alert("Hypo Thyroidism")</script><%
					    result="Hypo Thyroidism";
					//    response.sendRedirect("lab_test_reports.jsp");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					    //response.sendRedirect("patient_test_results.jsp?result=normal");
					    %><script>alert("Normal")</script><%
					    result="Normal";
					   // response.sendRedirect("lab_test_reports.jsp");

				 }
			 }
			 
		 }
	    else if(age<15){
			 if(gender.equals("F")){
				 ResultSet rs1=stmt.executeQuery("SELECT * FROM `normal_values` WHERE normal_values_id='3'");
				 rs1.next();
				 double tsh_min=Double.parseDouble(rs1.getString(4));
				 double tsh_max=Double.parseDouble(rs1.getString(5));
				 double t3_min=Double.parseDouble(rs1.getString(6));
				 double t3_max=Double.parseDouble(rs1.getString(7));
				 double t4_min=Double.parseDouble(rs1.getString(8));
				 double t4_max=Double.parseDouble(rs1.getString(9));
				 if(_tsh < tsh_min || _t3 > t3_max || _t4 > t4_max){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hyperthyroidism');");
					//    response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
					    %><script>alert("Hyper Thyroidism")</script><%
					    
					    result="Hyper Thyroidism";
					   // response.sendRedirect("lab_test_reports.jsp");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					  //  response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
					    %><script>alert("Hypo Thyroidism")</script><%
					    result="Hypo Thyroidism";
					   // response.sendRedirect("lab_test_reports.jsp");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					    //response.sendRedirect("patient_test_results.jsp?result=normal");
					    %><script>alert("Normal")</script><%
					    result="Normal";
					   // response.sendRedirect("lab_test_reports.jsp");

				 }
			 }
			 else{
				 ResultSet rs1=stmt.executeQuery("SELECT * FROM `normal_values` WHERE normal_values_id='4'");
				 rs1.next();
				 double tsh_min=Double.parseDouble(rs1.getString(4));
				 double tsh_max=Double.parseDouble(rs1.getString(5));
				 double t3_min=Double.parseDouble(rs1.getString(6));
				 double t3_max=Double.parseDouble(rs1.getString(7));
				 double t4_min=Double.parseDouble(rs1.getString(8));
				 double t4_max=Double.parseDouble(rs1.getString(9));
				 if(_tsh < tsh_min || _t3 > t3_max || _t4 > t4_max){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hyperthyroidism');");
					    //response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
					    %><script>alert("Hyper Thyroidism")</script><%
					    result="Hyper Thyroidism";
					    //response.sendRedirect("lab_test_reports.jsp");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					   // response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
					    %><script>alert("Hypo Thyroidism")</script><%
					    result="Hypo Thyroidism";
					   // response.sendRedirect("lab_test_reports.jsp");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					    //response.sendRedirect("patient_test_results.jsp?result=normal");
					    %><script>alert("Normal")</script><%
					    result="Normal";
					   // response.sendRedirect("lab_test_reports.jsp");

				 }
			 }
			 
		 }
		 else{
			 if(gender.equals("F")){
				 ResultSet rs1=stmt.executeQuery("SELECT * FROM `normal_values` WHERE normal_values_id='5'");
				 rs1.next();
				 double tsh_min=Double.parseDouble(rs1.getString(4));
				 double tsh_max=Double.parseDouble(rs1.getString(5));
				 double t3_min=Double.parseDouble(rs1.getString(6));
				 double t3_max=Double.parseDouble(rs1.getString(7));
				 double t4_min=Double.parseDouble(rs1.getString(8));
				 double t4_max=Double.parseDouble(rs1.getString(9));
				 if(_tsh < tsh_min || _t3 > t3_max || _t4 > t4_max){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hyperthyroidism');");
					    //response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
					    %><script>alert("Hyper Thyroidism")</script><%
					    
					    result="Hyper Thyroidism";
					    //response.sendRedirect("lab_test_reports.jsp");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    //response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
					    %><script>alert("Hypo Thyroidism")</script><%
					    result="Hypo Thyroidism";
					    //response.sendRedirect("lab_test_reports.jsp");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					   // response.sendRedirect("patient_test_results.jsp?result=normal");
					    %><script>alert("Normal")</script><%
					    result="Normal";
					    //response.sendRedirect("lab_test_reports.jsp");

				 }
			 }
			 else{
				 ResultSet rs1=stmt.executeQuery("SELECT * FROM `normal_values` WHERE normal_values_id='6'");
				 rs1.next();
				 double tsh_min=Double.parseDouble(rs1.getString(4));
				 double tsh_max=Double.parseDouble(rs1.getString(5));
				 double t3_min=Double.parseDouble(rs1.getString(6));
				 double t3_max=Double.parseDouble(rs1.getString(7));
				 double t4_min=Double.parseDouble(rs1.getString(8));
				 double t4_max=Double.parseDouble(rs1.getString(9));
				 if(_tsh < tsh_min || _t3 > t3_max || _t4 > t4_max){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hyperthyroidism');");
					//    response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
					    %><script>alert("Hyper Thyroidism")</script><%
					    result="Hyper Thyroidism";
					    //response.sendRedirect("lab_test_reports.jsp");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    //response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
					    %><script>alert("Hypo Thyroidism")</script><%
					    result="Hypo Thyroidism";
					    //response.sendRedirect("lab_test_reports.jsp");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					   // response.sendRedirect("patient_test_results.jsp?result=normal");
					    %><script>alert("Normal")</script><%
					    result="Normal";
					    //response.sendRedirect("lab_test_reports.jsp");

				 }
			 }
		 }
	    String body="TSH : "+tsh+"<br><br> T3 : "+t3+"<br><br> T4 : "+t4+"<br><br><br> Result : "+result+"<br><br><br><br> Note: Donot reply to this message.";
	   int val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`messages` (`message_sender_id`, `message_receiver_id`, `message_subject`, `message_body`, `message_sender_status`, `message_receiver_status`, `message_date`) VALUES ('"+un+"', '"+userid+"', 'Test Report', '"+body+"', 'sent', 'recieved', '"+today+"');");
	   %><script>alert("Test Report Send")</script> <%
         con.close();	
	}
	
}
catch(Exception ex){
	out.println("Exception \n\n"+ex);
}

%>  