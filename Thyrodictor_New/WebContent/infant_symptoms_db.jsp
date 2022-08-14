<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  >meta http-equiv="Refresh" content="0;url=patient_home.jsp"-->
<title>Insert title here</title>

<% 
//try {
String un =(String)session.getAttribute("patient");
 
	
    if(un==null){
    	response.sendRedirect("login.jsp");
    	}
	String qn1 = request.getParameter("qn1");
	//String qn2 = request.getParameter("qn2");
	String qn3 = request.getParameter("qn3");
	String medical_problems[]=request.getParameterValues("qn4");
	String qn4="",qn4v="";
	for(int i=0;i<medical_problems.length;i++)
	{
		qn4+=medical_problems[i]+" ";
	}
	if(!qn4.equals("No")){
		qn4v="Yes";
	}
	else{
		qn4v="No";
	}
	String qn5 = request.getParameter("qn5");
	String qn6 = request.getParameter("qn6");
	String qn7 = request.getParameter("qn7");
	String qn8 = request.getParameter("qn8");
	String qn9 = request.getParameter("qn9");
	String qn10 = request.getParameter("qn10");
	String qn11 = request.getParameter("qn11");
	String qn12 = request.getParameter("qn12");
	String qn13 = request.getParameter("qn13");
	String qn14 = request.getParameter("qn14");
	String qn15 = request.getParameter("qn15");
	String qn16 = request.getParameter("qn16");
	String qn17 = request.getParameter("qn17");
	String qn18 = request.getParameter("qn18");
	String qn19 = request.getParameter("qn19");
	String qn20 = request.getParameter("qn20");
	String qn21 = request.getParameter("qn21");
	String qn22 = request.getParameter("qn22");
	String qn23 = request.getParameter("qn23");
	String qn24 = request.getParameter("qn24");
	String qn25 = request.getParameter("qn25");
	String qn26 = request.getParameter("qn26");
	String qn27 = request.getParameter("qn27");
	String qn28 = request.getParameter("qn28");
	String qn29 = request.getParameter("qn29");
	String qn30 = request.getParameter("qn30");
	
	
	
	
	Connection con=null;
	Statement stmt=null;
	
	/* Create string of connection url within specified format with machine name, 
	port number and database name. Here machine name id localhost and 
	database name is usermaster. */ 
	String connectionURL = "jdbc:mysql://localhost:3306/test"; 
	
	// declare a connection by using Connection interface 
	//Connection connection = null; 
	
	// Load JBBC driver "com.mysql.jdbc.Driver" 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	
	/* Create a connection by using getConnection() method that takes parameters of 
	string type connection url, user name and password to connect to database. */ 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
   
	
	// check weather connection is established or not by isClosed() method 
	if(!con.isClosed()){
		 stmt=con.createStatement();
		 ResultSet rs=stmt.executeQuery("Select * from patient_details where patient_user_id='"+un+"'");  
		 rs.next();
		 String gender="";
		 gender=rs.getString(3);
		 String patient_id=rs.getString(1);
		 String id=rs.getString(1);
		 String dist=rs.getString(7);
		 out.println(gender);
		 int flag=0;
		 ResultSet k= stmt.executeQuery("select * from `testing_infant_symptoms` where patient_id='"+id+"';");
		 if(k.next()){
			 k.last();
			 String result=k.getString(33);
			 if(result.equals("hyper")){flag=1;}
			 if(result.equals("hypo")){flag=2;}
			 if(result.equals("goiter")){flag=4;}
			 if(result.equals("cancer")){flag=5;}
		 }
		 else{flag=3;}
		 k= stmt.executeQuery("select * from `investigation_details` where patient_id='"+id+"';");
	    // int flag=0;
	     if(k.last()){
		     //k.last();
		     String result=k.getString(10);
		     if(result.equals("hyperthyroidism")){flag=1;}
		     else if(result.equals("hypothyroidism")){flag=2;}
		     else if(result.equals("none")){flag=0;}
	     }
		   //int val =//stmt.executeUpdate("INSERT INTO `thyrodictor`.`patient_details` (`patient_id`, `patient_name`, `patient_gender`, `patient_dob`, `patient_email`, `patient_phn`, `patient_city_id`,`patient_photo`) VALUES ('', '"+name+"', '"+gender+"', '"+dob+"', '"+email+"', '"+phone+"', '"+city+"','"+photo+"')");
		   float posterior_x=1,posterior_c1,posterior_c2,posterior_c3,posterior_c4,posterior_c5;
			int i,j;
		   
			   //===========================Naive Bayes Starts Here==============================================================
					   
			   //hypo 1 3 37
			   //ResultSet val_y = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='hypo' and value='yes';");
			   //val_y.next();
			   //ResultSet val_n = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='hypo' and value='no';");
			   //val_n.next();
			   String qn[]={qn3,qn4v,qn5,qn6,qn7,qn8,qn9,qn10,qn11,qn12,qn13,qn14,qn15,qn16,qn17,qn18,qn19,qn20,qn21,qn22,qn23,qn24,qn25,qn26,qn27,qn28,qn29,qn30};
			   for(i=0,j=4;i<28;i++,j++){
				   if(j==32){j++;}
				   if(qn[i].equals("Yes")){
					   ResultSet val_y = stmt.executeQuery("select * from infant_symptoms where  type_of_thyroid_disease='hypo' and value='yes';");
					   val_y.next();
					   posterior_x=posterior_x*val_y.getFloat(j);
				   }
				   else{
					   ResultSet val_n = stmt.executeQuery("select * from infant_symptoms where  type_of_thyroid_disease='hypo' and value='no';");
					   val_n.next();
					   posterior_x=posterior_x*val_n.getFloat(j);
				   }
			   }
			   ResultSet prior_hypo= stmt.executeQuery("select total from infant_symptoms where  type_of_thyroid_disease='hypo';");
			   prior_hypo.next();
			   float hypo=prior_hypo.getFloat(1);
			   ResultSet total= stmt.executeQuery("select count(*) from learning_infant_symptoms ;");
			   total.next();
			   float ttl=total.getFloat(1);
			   float prior=hypo/ttl;
			   
			   //============================
			   posterior_c1=posterior_x*prior;
			   //=============================
				
					   
				//hyper
				posterior_x=1;
				//val_y = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='hyper' and value='yes';");
				//val_n = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='hyper' and value='no';");
				//val_y.next();
				//val_n.next();
				for(i=0,j=4;i<28;i++,j++){
					   if(j==32){j++;}
					   if(qn[i].equals("Yes")){
						   ResultSet val_y = stmt.executeQuery("select * from infant_symptoms where  type_of_thyroid_disease='hyper' and value='yes';");
						   val_y.next();
						   posterior_x=posterior_x*val_y.getFloat(j);
					   }
					   else{
						   ResultSet val_n = stmt.executeQuery("select * from infant_symptoms where  type_of_thyroid_disease='hyper' and value='no';");
						   val_n.next();
						   posterior_x=posterior_x*val_n.getFloat(j);
					   }
				   }
				   ResultSet prior_hyper= stmt.executeQuery("select total from infant_symptoms where  type_of_thyroid_disease='hyper';");
				   prior_hyper.next();
				   float hyper=prior_hyper.getFloat(1);
				  // ResultSet total= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='male';");
				 //  total.next();
				   prior=hyper/ttl;
				   
				   //============================
				   posterior_c2=posterior_x*prior;
				   //=============================
					
					
				//Goiter
				   posterior_x=1;
					//val_y = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='goiter' and value='yes';");
					//val_n = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='goiter' and value='no';");
					//val_y.next();
				//val_n.next();
					for(i=0,j=4;i<28;i++,j++){
						   if(j==32){j++;}
						   if(qn[i].equals("Yes")){
							   ResultSet val_y = stmt.executeQuery("select * from infant_symptoms where  type_of_thyroid_disease='goiter' and value='yes';");
							   val_y.next();
							   posterior_x=posterior_x*val_y.getFloat(j);
						   }
						   else{
							   ResultSet val_n = stmt.executeQuery("select * from infant_symptoms where  type_of_thyroid_disease='goiter' and value='no';");
							   val_n.next();
							   posterior_x=posterior_x*val_n.getFloat(j);
						   }
					   }
					   ResultSet prior_goiter= stmt.executeQuery("select total from infant_symptoms where type_of_thyroid_disease='goiter';");
					   prior_goiter.next();
					   float goiter=prior_goiter.getFloat(1);
					  // ResultSet total= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='male';");
					 //  total.next();
					   prior=goiter/ttl;
					   
					   //============================
					   posterior_c3=posterior_x*prior;
					   //=============================
						
						
					//cancer
					   posterior_x=1;
						//val_y = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='cancer' and value='yes';");
						//val_n = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='cancer' and value='no';");
						//val_y.next();
						//val_n.next();
						for(i=0,j=4;i<28;i++,j++){
							   if(j==32){j++;}
							   if(qn[i].equals("Yes")){
								   ResultSet val_y = stmt.executeQuery("select * from infant_symptoms where  type_of_thyroid_disease='cancer' and value='yes';");
								   val_y.next();
								   posterior_x=posterior_x*val_y.getFloat(j);
							   }
							   else{
								   ResultSet val_n = stmt.executeQuery("select * from infant_symptoms where  type_of_thyroid_disease='cancer' and value='no';");
								   val_n.next();
								   posterior_x=posterior_x*val_n.getFloat(j);
							   }
						   }
						   ResultSet prior_cancer= stmt.executeQuery("select total from infant_symptoms where type_of_thyroid_disease='cancer';");
						   prior_cancer.next();
						   float cancer=prior_cancer.getFloat(1);
						  // ResultSet total= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='male';");
						 //  total.next();
						   prior=cancer/ttl;
						   
						   //============================
						   posterior_c4=posterior_x*prior;
						   //=============================
							
					//None
						   posterior_x=1;
							//val_y = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='none' and value='yes';");
							//val_n = stmt.executeQuery("select * from adult_symptoms where adult_gender='male' and type_of_thyroid_disease='none' and value='no';");
						//	val_y.next();
							//val_n.next();
							for(i=0,j=4;i<28;i++,j++){
								   if(j==32){j++;}
								   if(qn[i].equals("Yes")){
									   ResultSet val_y = stmt.executeQuery("select * from infant_symptoms where type_of_thyroid_disease='none' and value='yes';");
									   val_y.next();
									   posterior_x=posterior_x*val_y.getFloat(j);
								   }
								   else{
									   ResultSet val_n = stmt.executeQuery("select * from infant_symptoms where type_of_thyroid_disease='none' and value='no';");
										val_n.next();
									   posterior_x=posterior_x*val_n.getFloat(j);
								   }
							   }
							   ResultSet prior_none= stmt.executeQuery("select total from infant_symptoms where type_of_thyroid_disease='none';");
							   prior_none.next();
							   float none=prior_none.getFloat(1);
							  // ResultSet total= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='male';");
							 //  total.next();
							   prior=none/ttl;
							   
							   //============================
							   posterior_c5=posterior_x*prior;
							   //=============================
								
					//Predicting....
					float l;
					String cls = "";
					if(posterior_c1>posterior_c2){
						l=posterior_c1;
						cls="hypo";
					}
					else{
						l=posterior_c2;
						cls="hyper";
					}
					if(l<posterior_c3){
						l=posterior_c3;
						cls="goiter";
					}
					if(l<posterior_c4){
						l=posterior_c4;
						cls="cancer";
					}
					if(l<posterior_c5){
						l=posterior_c5;
						cls="none";
					}
				//===================================Naive Bayes Ends Here===========================================================
						
				int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`testing_infant_symptoms` (`patient_id`,`infant_gender`,`ever_diagnosed_thyroid_disease`,`hereditary`,`medical_problems`,`poor_appetite`,`choking_while_nursing`,`failure_to_gain_weight_or_length`,`constipation`,`jaundice`,`trouble_breathing`,`hoarse_cry`,`sluggishness`,`enlarged_belly`,`cold_and_mottled_skin`,`dry_and_scaly_skin`,`poor_growth_of_hair_and_nails`,`delay_in_the_appearence_of_teeth`,`shorter_finger_and_toes`,`puffy_and_large_head`,`swollen_tongue`,`low_birth_weight`,`fast_heart_beat`,`high_blood_pressure`,`irritability`,`difficulty_in_sleeping`,`bulging_eyes`,`diarrhea`,`slowed_growth`,`intellectual_disability`,`hyper_activity`,`result_of_prediction`)VALUES('"+patient_id+"','"+gender+"','"+qn1+"','"+qn3+"','"+qn4+"','"+qn5+"','"+qn6+"','"+qn7+"','"+qn8+"','"+qn9+"','"+qn10+"','"+qn11+"','"+qn12+"','"+qn13+"','"+qn14+"','"+qn15+"','"+qn16+"','"+qn17+"','"+qn18+"','"+qn19+"','"+qn20+"','"+qn21+"','"+qn22+"','"+qn23+"','"+qn24+"','"+qn25+"','"+qn26+"','"+qn27+"','"+qn28+"','"+qn29+"','"+qn30+"','"+cls+"');");
				if(cls.equals("hyper")){
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
				    if(flag==4){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    	
				    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='goiter' and `district_id`='"+dist+"';");
				    	count.next();
				    	c=count.getInt(1)-1;
				    	sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				    if(flag==5){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hyperthyroidism' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    	
				    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='cancer' and `district_id`='"+dist+"';");
				    	count.next();
				    	c=count.getInt(1)-1;
				    	sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				}
				else if(cls.equals("hypo")){
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
				    if(flag==4){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    	
				    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='goiter' and `district_id`='"+dist+"';");
				    	count.next();
				    	c=count.getInt(1)-1;
				    	sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				    if(flag==5){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='hypothyroidism' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    	
				    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='cancer' and `district_id`='"+dist+"';");
				    	count.next();
				    	c=count.getInt(1)-1;
				    	sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				}
				else if(cls.equals("goiter")){
					if(flag==0){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='goiter' and `district_id`='"+dist+"';");
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
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='goiter' and `district_id`='"+dist+"';");
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
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='goiter' and `district_id`='"+dist+"';");
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
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='goiter' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				    
				    if(flag==5){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='goiter' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    	
				    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='cancer' and `district_id`='"+dist+"';");
				    	count.next();
				    	c=count.getInt(1)-1;
				    	sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				}
				else if(cls.equals("cancer")){
					if(flag==0){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='cancer' and `district_id`='"+dist+"';");
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
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='cancer' and `district_id`='"+dist+"';");
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
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='cancer' and `district_id`='"+dist+"';");
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
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='cancer' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				    
				    if(flag==4){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='cancer' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    	
				    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='goiter' and `district_id`='"+dist+"';");
				    	count.next();
				    	c=count.getInt(1)-1;
				    	sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				}
				else{
					
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
				    
				    if(flag==4){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    	
				    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='goiter' and `district_id`='"+dist+"';");
				    	count.next();
				    	c=count.getInt(1)-1;
				    	sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				    if(flag==5){
				    	ResultSet count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='none' and `district_id`='"+dist+"';");
				    	count.next();
				    	int c=count.getInt(1)+1;
				    	String sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    	
				    	count =stmt.executeQuery("select `count`,`sl_no` from `thyrodictor`.`graph_table` WHERE `thyroid_type`='cancer' and `district_id`='"+dist+"';");
				    	count.next();
				    	c=count.getInt(1)-1;
				    	sl=count.getString(2);
				    	val=stmt.executeUpdate("UPDATE `thyrodictor`.`graph_table` SET `count`="+c+" WHERE `sl_no`='"+sl+"';");
				    }
				}
				
				response.sendRedirect("infant_prediction.jsp?result="+cls+"");
		 
				
			    
				
				
		    //int val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`patient_details` (`patient_name`, `patient_gender`, `patient_dob`, `patient_email`, `patient_phn`, `patient_district_id`, `patient_photo`) VALUES ('"+name+"', '"+gender+"', '"+dob+"', '"+email+"', '"+phone+"', '"+district+"', '"+photo+"');");
		    
		    
		    
         	//session.setAttribute("patient",un);
	        //response.sendRedirect("adult_prediction.jsp");
		con.close();	
	}
//}
/*catch(Exception nullPointerException){
	//out.println("Exception \n\n"+ex);
	%>
	<!--  <script>alert("Enter medical details");</script>-->
	<%
}*/
%>
</head>
<body>
</body>
</html>