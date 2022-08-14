<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %>
 <%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Refresh" content="5;url=patient_test_reports.jsp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
String un =(String)session.getAttribute("patient");
 
	
    if(un==null){
    	response.sendRedirect("login.jsp");
    	}
	String tsh = request.getParameter("tsh");
	String t3 = request.getParameter("t3");
	String t4 = request.getParameter("t4");
	String height = request.getParameter("height");
	String weight = request.getParameter("weight");
	Connection con=null;
	Statement stmt=null;
	String connectionURL= "jdbc:mysql://localhost:3306/test"; 
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
	if(!con.isClosed()){
		stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("Select * FROM patient_details where patient_user_id='"+un+"'");
		rs.next();
		String patient_id=rs.getString(1);
		String dob=rs.getString(4);
		String gender=rs.getString(3);
		String id=rs.getString(1);
		String dist=rs.getString(7);
		//out.println(gender);
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
     ResultSet k= stmt.executeQuery("select * from `investigation_details` where patient_id='"+id+"';");
     int flag=0;
     if(k.next()){
	     k.last();
	     String result=k.getString(10);
	     if(result.equals("hyperthyroidism")){flag=1;}
	     else if(result.equals("hypothyroidism")){flag=2;}
	     else if(result.equals("none")){flag=0;}
     }
     else{flag=3;}
    /*k= stmt.executeQuery("select * from `testing_infant_symptoms` where patient_id='"+id+"';");
	 if(k.next()){
		 k.last();
		 String result=k.getString(33);
		 if(result.equals("hyper")){flag=1;}
		 if(result.equals("hypo")){flag=2;}
		 if(result.equals("goiter")){flag=4;}
		 if(result.equals("cancer")){flag=5;}
	 }
    /*if( k.next()){flag=0;}
    k= stmt.executeQuery("select * from `investigation_details` where investigation_result='hyperthyroidism' and patient_id='"+id+"';");
    if( k.next()){flag=1;}
    k= stmt.executeQuery("select * from `investigation_details` where investigation_result='hypothyroidism' and patient_id='"+id+"';");
    if( k.next()){flag=2;}
    k= stmt.executeQuery("select count(*) from `investigation_details` where patient_id='"+id+"';");
    k.next();
    if(k.getInt(1)==0){flag=3;}*/
	    if(age<2){
	    	k= stmt.executeQuery("select * from `testing_infant_symptoms` where patient_id='"+id+"';");
	   	 	if(k.next()){
	   		 k.last();
	   		 String result=k.getString(33);
	   		 if(result.equals("hyper")){flag=1;}
	   		 if(result.equals("hypo")){flag=2;}
	   		 //if(result.equals("goiter")){flag=4;}
	   		 //if(result.equals("cancer")){flag=5;}
	   	 }
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
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=normal");

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
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=normal");

				 }
			 }
			 
		 }else if(age<15){
			ResultSet ks= stmt.executeQuery("select * from `testing_child_symptoms` where patient_id='"+id+"';");
			 if(ks.last()){
				 //ks.last();
				 String result=ks.getString(33);
				 if(result.equals("hyper")){flag=1;}
				 if(result.equals("hypo")){flag=2;}
				 //if(result.equals("goiter")){flag=4;}
				 //if(result.equals("cancer")){flag=5;}
			 }
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
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=normal");

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
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=normal");

				 }
			 }
			 
		 }else{
			 ResultSet ks= stmt.executeQuery("select * from `testing_infant_symptoms` where patient_id='"+id+"';");
			 if(ks.last()){
				 //ks.last();
				 String result=ks.getString(33);
				 if(result.equals("hyper")){flag=1;}
				 if(result.equals("hypo")){flag=2;}
				 if(result.equals("goiter")){flag=4;}
				 if(result.equals("cancer")){flag=5;}
			 }
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
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=normal");

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
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hyperthyroidism");
				 }
				 else if(_tsh > tsh_max || _t4 < t4_min){
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'hypothyroidism');");
					    if(flag==0){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=hypothyroidism");
				 }
				 else{
					    int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`investigation_details` (`patient_id`, `investigation_age`, `investigation_date`, `investigation_TSH`, `investigation_T3`, `investigation_T4`, `investigation_height`, `investigation_weight`, `investigation_result`) VALUES ('"+patient_id+"', '"+age_str+"', '"+today+"', '"+tsh+"', '"+t3+"', '"+t4+"', '"+height+"', '"+weight+"', 'normal');");
					    if(flag==1){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==2){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    	
					    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
					    	count.next();
					    	c=count.getInt(1)-1;
					    	sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    if(flag==3){
					    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
					    	count.next();
					    	int c=count.getInt(1)+1;
					    	String sl=count.getString(2);
					    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
					    }
					    response.sendRedirect("patient_test_results.jsp?result=normal");

				 }
			 }
		 }
	    con.close();	
	}
	
}
catch(Exception ex){
	out.println("Exception \n\n"+ex);
	out.println("Something went wrong!!!");
	
}
%>
</body>
</html>