<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.util.Iterator"%>

 

<%@ page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" content="0;url=admin_home.jsp">

<title>Insert title here</title>



<% 
try {
	// variables for Total count in each class
	int total_ad_m_hypo;
	int total_ad_f_hypo;
	int total_ad_m_hyper;
	int total_ad_f_hyper;
	int total_ad_m_goiter;
	int total_ad_f_goiter;
	int total_ad_m_cancer;
	int total_ad_f_cancer;
	int total_ad_m_none;
	int total_ad_f_none;
	
	int total_ch_m_hypo;
	int total_ch_f_hypo;
	int total_ch_m_hyper;
	int total_ch_f_hyper;
	int total_ch_m_goiter;
	int total_ch_f_goiter;
	int total_ch_m_cancer;
	int total_ch_f_cancer;
	int total_ch_m_none;
	int total_ch_f_none;
	
	int total_in_hypo;
	int total_in_hyper;
	int total_in_goiter;
	int total_in_cancer;
	int total_in_none;
	
	//variables for number of patients having each symptom in each class
	int adult_f_sym[]= new int[38];
	int adult_m_sym[]=new int[38];
	
	int child_f_sym[]=new int[30];
	int child_m_sym[]=new int[30];
	
	int infant_sym[]= new int[28];
	
	//Variables for Final values
	float adult_f_sym_val[]= new float[38];
	float adult_m_sym_val[]=new float[38];
	
	float child_f_sym_val[]=new float[30];
	float child_m_sym_val[]=new float[30];
	
	float infant_sym_val[]= new float[28];
	
	int i;
	String un =(String)session.getAttribute("admin");
	//String FileName = request.getParameter("FileName");
	//String ageGrp = request.getParameter("ageGrp");
    if(un==null){
    	response.sendRedirect("login.jsp");
    	}
	
	Connection con=null;
	Statement stmt=null;
	String connectionURL = "jdbc:mysql://localhost:3306/test"; 
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/thyrodictor", "root", "root");
	if(!con.isClosed()){
		stmt=con.createStatement();
		
		//Obtaining total count in each class
		ResultSet rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='hypothyroidism';");
		rs.next();
		total_ad_f_hypo= rs.getInt(1);
		out.println(total_ad_f_hypo);
		
		rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hypothyroidism';");
		rs.next();
		total_ad_m_hypo= rs.getInt(1);
		out.println(total_ad_m_hypo);
		
		rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hyperthyroidism';");
		rs.next();
		total_ad_m_hyper= rs.getInt(1);
		out.println(total_ad_m_hyper);
		
		rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='hyperthyroidism';");
		rs.next();
		total_ad_f_hyper= rs.getInt(1);
		out.println(total_ad_f_hyper);
		
		rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='Goiter';");
		rs.next();
		total_ad_f_goiter= rs.getInt(1);
		out.println(total_ad_f_goiter);
		
		rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='Goiter';");
		rs.next();
		total_ad_m_goiter= rs.getInt(1);
		out.println(total_ad_m_goiter);
		
		rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='Thyroid cancer';");
		rs.next();
		total_ad_f_cancer= rs.getInt(1);
		out.println(total_ad_f_cancer);
		
		rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='Thyroid cancer';");
		rs.next();
		total_ad_m_cancer= rs.getInt(1);
		out.println(total_ad_m_cancer);
		
		rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='Not Applicable';");
		rs.next();
		total_ad_f_none= rs.getInt(1);
		out.println(total_ad_f_none);
		
		rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='Not Applicable';");
		rs.next();
		total_ad_m_none= rs.getInt(1);
		out.println(total_ad_m_none);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='hypothyroidism';");
		rs.next();
		total_ch_f_hypo= rs.getInt(1);
		out.println(total_ch_f_hypo);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='hypothyroidism';");
		rs.next();
		total_ch_m_hypo= rs.getInt(1);
		out.println(total_ch_m_hypo);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='hyperthyroidism';");
		rs.next();
		total_ch_m_hyper= rs.getInt(1);
		out.println(total_ch_m_hyper);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='hyperthyroidism';");
		rs.next();
		total_ch_f_hyper= rs.getInt(1);
		out.println(total_ch_f_hyper);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='Goiter';");
		rs.next();
		total_ch_f_goiter= rs.getInt(1);
		out.println(total_ch_f_goiter);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='Goiter';");
		rs.next();
		total_ch_m_goiter= rs.getInt(1);
		out.println(total_ch_m_goiter);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='Thyroid cancer';");
		rs.next();
		total_ch_f_cancer= rs.getInt(1);
		out.println(total_ch_f_cancer);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='Thyroid cancer';");
		rs.next();
		total_ch_m_cancer= rs.getInt(1);
		out.println(total_ch_m_cancer);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='Not Applicable';");
		rs.next();
		total_ch_f_none= rs.getInt(1);
		out.println(total_ch_f_none);
		
		rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='Not Applicable';");
		rs.next();
		total_ch_m_none= rs.getInt(1);
		out.println(total_ch_m_none);
		
		rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='hypothyroidism';");
		rs.next();
		total_in_hypo= rs.getInt(1);
		out.println(total_in_hypo);
		
		
		rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='hyperthyroidism';");
		rs.next();
		total_in_hyper= rs.getInt(1);
		out.println(total_in_hyper);
		
		
		rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='Goiter';");
		rs.next();
		total_in_goiter= rs.getInt(1);
		out.println(total_in_goiter);
		
		rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='Thyroid cancer';");
		rs.next();
		total_in_cancer= rs.getInt(1);
		out.println(total_in_cancer);
		
		
		rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='Not Applicable';");
		rs.next();
		total_in_none= rs.getInt(1);
		out.println(total_in_none);
		
		//Obtaining number of patients having each symptom in adults- Female
				//hypo
		String symptoms[]={"hereditary","medical_problems","palpitation","poor_concentration","memory_loss","difficulty_in_sleeping","excessive_need_for_sleep","fatigue","weak_muscles","sore_muscles","anxiety","depression","dry_skin","itchy_skin","unusual_hair_loss","dry_hair","peeling_nails","infrequent_bowel_movement","frequent_bowel_movement","unexplained_weight_gain","unexplained_weight_loss","persistant_pain_or_swelling","hoarseness","lump_in_the_throat","eye_pain_or_double_vision","swelling_of_eyes","change_in_facial_appearence","difficulty_in_tolerating_cold","excessive_sweating","hand_tremor","loss_of_appetite","trouble_swallowing","trouble_breathing","loss_of_menstrual_periods","irregular_periods","excessive_menstrual_flow","miscarried","pms"};
		for(i=0;i<38;i++){
			rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='hypothyroidism' and "+symptoms[i]+"='yes';");
			rs.next();
			adult_f_sym[i]=rs.getInt(1);
			if(total_ad_f_hypo>0){
			adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_hypo;
			}
			else{
				adult_f_sym_val[i]=0;
			}
			out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
		}
		int val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='hypo';");
		val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hypo', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_hypo+"', 'yes');");
		
		for(i=0;i<38;i++){
			rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='hypothyroidism' and "+symptoms[i]+"='no';");
			rs.next();
			adult_f_sym[i]=rs.getInt(1);
			if(total_ad_f_hypo>0){
			adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_hypo;
			}
			else{
				adult_f_sym_val[i]=0;
			}
			out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
		}
		val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hypo', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_hypo+"', 'no');");

		
			//hyper
		for(i=0;i<38;i++){
			rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='hyperthyroidism' and "+symptoms[i]+"='yes';");
			rs.next();
			adult_f_sym[i]=rs.getInt(1);
			if(total_ad_f_hyper>0){
			adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_hyper;
			}
			else{
				adult_f_sym_val[i]=0;
			}
			out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
		}
			val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='hyper';");
			val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hyper', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_hyper+"', 'yes');");

			for(i=0;i<38;i++){
				rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='hyperthyroidism' and "+symptoms[i]+"='no';");
				rs.next();
				adult_f_sym[i]=rs.getInt(1);
				if(total_ad_f_hyper>0){
				adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_hyper;
				}
				else{
					adult_f_sym_val[i]=0;
				}
				out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
			}
				//val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='hyper';");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hyper', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_hyper+"', 'no');");

			
				//goiter
			for(i=0;i<38;i++){
				rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='goiter' and "+symptoms[i]+"='yes';");
				rs.next();
				adult_f_sym[i]=rs.getInt(1);
				if(total_ad_f_goiter>0){
				adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_goiter;
				}
				else{
					adult_f_sym_val[i]=0;
				}
				out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
				}
				val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='goiter';");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'goiter', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_goiter+"', 'yes');");

				for(i=0;i<38;i++){
					rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='goiter' and "+symptoms[i]+"='no';");
					rs.next();
					adult_f_sym[i]=rs.getInt(1);
					if(total_ad_f_goiter>0){
					adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_goiter;
					}
					else{
						adult_f_sym_val[i]=0;
					}
					out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
					}
					//val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='goiter';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'goiter', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_goiter+"', 'no');");

				
					//cancer
				for(i=0;i<38;i++){
					rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='cancer' and "+symptoms[i]+"='yes';");
					rs.next();
					adult_f_sym[i]=rs.getInt(1);
					if(total_ad_f_cancer>0){
					adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_cancer;
					}
					else{
						adult_f_sym_val[i]=0;
					}
					out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
					}
					val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='cancer';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'cancer', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_cancer+"', 'yes');");

					for(i=0;i<38;i++){
						rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='cancer' and "+symptoms[i]+"='no';");
						rs.next();
						adult_f_sym[i]=rs.getInt(1);
						if(total_ad_f_cancer>0){
						adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_cancer;
						}
						else{
							adult_f_sym_val[i]=0;
						}
						out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
						}
						//val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='cancer';");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'cancer', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_cancer+"', 'no');");

					
						//none
					for(i=0;i<38;i++){
						rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='Not Applicable' and "+symptoms[i]+"='yes';");
						rs.next();
						adult_f_sym[i]=rs.getInt(1);
						if(total_ad_f_none>0){
						adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_none;
						}
						else{
							adult_f_sym_val[i]=0;
						}
						out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
						}
						val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='none';");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'none', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_none+"', 'yes');");

						for(i=0;i<38;i++){
							rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='Not Applicable' and "+symptoms[i]+"='no';");
							rs.next();
							adult_f_sym[i]=rs.getInt(1);
							if(total_ad_f_none>0){
							adult_f_sym_val[i]=rs.getFloat(1)/total_ad_f_none;
							}
							else{
								adult_f_sym_val[i]=0;
							}
							out.println("\n"+adult_f_sym[i]+"  :  "+adult_f_sym_val[i]);
							}
							//val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Female' and type_of_thyroid_disease='none';");
							val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'none', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Female', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_f_none+"', 'no');");

						
		//Obtaining number of patients having each symptom in adults- Male
				//hypo
			for(i=0;i<38;i++){
			rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hypothyroidism' and "+symptoms[i]+"='yes';");
			rs.next();
			adult_m_sym[i]=rs.getInt(1);
			if(total_ad_m_hypo>0){	
			adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_hypo;
			}
			else{
				adult_f_sym_val[i]=0;
			}
			out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
			}
			val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hypo';");
			val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hypo', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_hypo+"', 'yes');");

			for(i=0;i<38;i++){
				rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hypothyroidism' and "+symptoms[i]+"='no';");
				rs.next();
				adult_m_sym[i]=rs.getInt(1);
				if(total_ad_m_hypo>0){	
				adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_hypo;
				}
				else{
					adult_f_sym_val[i]=0;
				}
				out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
				}
				//val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hypo';");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hypo', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_hypo+"', 'no');");

			
			//hyper
			for(i=0;i<38;i++){
				rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hyperthyroidism' and "+symptoms[i]+"='yes';");
				rs.next();
				adult_m_sym[i]=rs.getInt(1);
				if(total_ad_m_hyper>0){	
				adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_hyper;
				}
				else{
					adult_f_sym_val[i]=0;
				}
				out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
				}
				val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hyper';");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hyper', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_hyper+"', 'yes');");

				for(i=0;i<38;i++){
					rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hyperthyroidism' and "+symptoms[i]+"='no';");
					rs.next();
					adult_m_sym[i]=rs.getInt(1);
					if(total_ad_m_hyper>0){	
					adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_hyper;
					}
					else{
						adult_f_sym_val[i]=0;
					}
					out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
					}
//					val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='hyper';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hyper', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_hyper+"', 'no');");

				
				
				//goiter
				for(i=0;i<38;i++){
					rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='goiter' and "+symptoms[i]+"='yes';");
					rs.next();
					adult_m_sym[i]=rs.getInt(1);
					if(total_ad_m_goiter>0){
					adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_goiter;
					}
					else{
						adult_f_sym_val[i]=0;
					}
					out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
					}
					val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='goiter';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'goiter', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_goiter+"', 'yes');");

					for(i=0;i<38;i++){
						rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='goiter' and "+symptoms[i]+"='no';");
						rs.next();
						adult_m_sym[i]=rs.getInt(1);
						if(total_ad_m_goiter>0){
						adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_goiter;
						}
						else{
							adult_f_sym_val[i]=0;
						}
						out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
						}
						//val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='goiter';");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'goiter', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_goiter+"', 'no');");

					
					//cancer
				for(i=0;i<38;i++){
					rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='cancer' and "+symptoms[i]+"='yes';");
					rs.next();
					adult_m_sym[i]=rs.getInt(1);
					if(total_ad_m_cancer>0){
					adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_cancer;
					}
					else{
						adult_f_sym_val[i]=0;
					}
					out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
					}
					val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='cancer';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'cancer', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_cancer+"', 'yes');");

					for(i=0;i<38;i++){
						rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='cancer' and "+symptoms[i]+"='no';");
						rs.next();
						adult_m_sym[i]=rs.getInt(1);
						if(total_ad_m_cancer>0){
						adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_cancer;
						}
						else{
							adult_f_sym_val[i]=0;
						}
						out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
						}
						//val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='cancer';");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'cancer', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_cancer+"', 'no');");

					
					//none
				for(i=0;i<38;i++){
					rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='Not Applicable' and "+symptoms[i]+"='yes';");
					rs.next();
					adult_m_sym[i]=rs.getInt(1);
					if(total_ad_m_none>0){
					adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_none;
					}
					else{
						adult_f_sym_val[i]=0;
					}
					out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
					}
					val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='none';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'none', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_none+"', 'yes');");

					for(i=0;i<38;i++){
						rs= stmt.executeQuery("select count(*) from learning_adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='Not Applicable' and "+symptoms[i]+"='no';");
						rs.next();
						adult_m_sym[i]=rs.getInt(1);
						if(total_ad_m_none>0){
						adult_f_sym_val[i]=rs.getFloat(1)/total_ad_m_none;
						}
						else{
							adult_f_sym_val[i]=0;
						}
						out.println("\n"+adult_m_sym[i]+"  :  "+adult_f_sym_val[i]);
						}
						//val=stmt.executeUpdate("delete from adult_symptoms where adult_gender='Male' and type_of_thyroid_disease='none';");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`adult_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'none', '"+adult_f_sym_val[0]+"', '"+adult_f_sym_val[1]+"', '"+adult_f_sym_val[2]+"', '"+adult_f_sym_val[3]+"', '"+adult_f_sym_val[4]+"', '"+adult_f_sym_val[5]+"', '"+adult_f_sym_val[6]+"', '"+adult_f_sym_val[7]+"', '"+adult_f_sym_val[8]+"', '"+adult_f_sym_val[9]+"', '"+adult_f_sym_val[10]+"', '"+adult_f_sym_val[11]+"', '"+adult_f_sym_val[12]+"', '"+adult_f_sym_val[13]+"', '"+adult_f_sym_val[14]+"', '"+adult_f_sym_val[15]+"', '"+adult_f_sym_val[16]+"', '"+adult_f_sym_val[17]+"', '"+adult_f_sym_val[18]+"', '"+adult_f_sym_val[19]+"', '"+adult_f_sym_val[20]+"', '"+adult_f_sym_val[21]+"', '"+adult_f_sym_val[22]+"', '"+adult_f_sym_val[23]+"', '"+adult_f_sym_val[24]+"', '"+adult_f_sym_val[25]+"', '"+adult_f_sym_val[26]+"', '"+adult_f_sym_val[27]+"', '"+adult_f_sym_val[28]+"', '"+adult_f_sym_val[29]+"', '"+adult_f_sym_val[30]+"', '"+adult_f_sym_val[31]+"', '"+adult_f_sym_val[32]+"', 'Male', '"+adult_f_sym_val[33]+"', '"+adult_f_sym_val[34]+"', '"+adult_f_sym_val[35]+"', '"+adult_f_sym_val[36]+"', '"+adult_f_sym_val[37]+"', '"+total_ad_m_none+"', 'no');");

					
		//Obtaining number of patients having each symptom in children- Female
		String ch_symptoms[]={"hereditary","medical_problems","deceleration_of_growth","rough_dry_skin","constipation","cold_tolerance","fatigue","sleeping_more","brusing_easily","headache","vision_problems","early_or_delayed_puberty","emotional_liability","short_attension_span","finger_tremor","increased_appetite","weight_loss","swelling_at_the_front_of_neck","protruding_eyes","upper_eyelid_lag","infrequent_blinking","flushed_skin","excessive_sweating","muscle_weakness","palpitation","loss_of_menstrual_periods","irregular_periods","excessive_menstrual_flow","miscarried","pms"};
			//hypo
		for(i=0;i<30;i++){
			rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='hypothyroidism' and "+ch_symptoms[i]+"='yes';");
			rs.next();
			child_f_sym[i]=rs.getInt(1);
			if(total_ch_f_hypo>0){
			child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_hypo;
			}
			else{
				child_f_sym_val[i]=0;
			}
			out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
			}
			val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='hypo';");
			val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hypo', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_hypo+"', 'yes');");
	
			for(i=0;i<30;i++){
				rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='hypothyroidism' and "+ch_symptoms[i]+"='no';");
				rs.next();
				child_f_sym[i]=rs.getInt(1);
				if(total_ch_f_hypo>0){
				child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_hypo;
				}
				else{
					child_f_sym_val[i]=0;
				}
				out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
				}
				//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='hypo';");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hypo', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_hypo+"', 'no');");

			
			//hyper
			for(i=0;i<30;i++){
				rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='hyperthyroidism' and "+ch_symptoms[i]+"='yes';");
				rs.next();
				child_f_sym[i]=rs.getInt(1);
				if(total_ch_f_hyper>0){
				child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_hyper;
				}
				else{
					child_f_sym_val[i]=0;
				}
				out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
				}
				val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='hyper';");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hyper', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_hyper+"', 'yes');");

				for(i=0;i<30;i++){
					rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='hyperthyroidism' and "+ch_symptoms[i]+"='no';");
					rs.next();
					child_f_sym[i]=rs.getInt(1);
					if(total_ch_f_hyper>0){
					child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_hyper;
					}
					else{
						child_f_sym_val[i]=0;
					}
					out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
					}
					//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='hyper';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hyper', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_hyper+"', 'no');");

				
				//goiter
				for(i=0;i<30;i++){
					rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='goiter' and "+ch_symptoms[i]+"='yes';");
					rs.next();
					child_f_sym[i]=rs.getInt(1);
					if(total_ch_f_goiter>0){
					child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_goiter;
					}
					else{
						child_f_sym_val[i]=0;
					}
					out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
					}
					val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='goiter';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'goiter', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_goiter+"', 'yes');");

					for(i=0;i<30;i++){
						rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='goiter' and "+ch_symptoms[i]+"='no';");
						rs.next();
						child_f_sym[i]=rs.getInt(1);
						if(total_ch_f_goiter>0){
						child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_goiter;
						}
						else{
							child_f_sym_val[i]=0;
						}
						out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
						}
						//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='goiter';");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'goiter', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_goiter+"', 'no');");

					
				//cancer
					for(i=0;i<30;i++){
						rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='cancer' and "+ch_symptoms[i]+"='yes';");
						rs.next();
						child_f_sym[i]=rs.getInt(1);
						if(total_ch_f_cancer>0){
						child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_cancer;
						}
						else{
							child_f_sym_val[i]=0;
						}
						out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
						}
						val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='cancer';");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'cancer', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_cancer+"', 'yes');");

						for(i=0;i<30;i++){
							rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='cancer' and "+ch_symptoms[i]+"='no';");
							rs.next();
							child_f_sym[i]=rs.getInt(1);
							if(total_ch_f_cancer>0){
							child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_cancer;
							}
							else{
								child_f_sym_val[i]=0;
							}
							out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
							}
							//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='cancer';");
							val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'cancer', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_cancer+"', 'no');");

						
				//none
						for(i=0;i<30;i++){
							rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='Not Applicable' and "+ch_symptoms[i]+"='yes';");
							rs.next();
							child_f_sym[i]=rs.getInt(1);
							if(total_ch_f_none>0){
							child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_none;
							}
							else{
								child_f_sym_val[i]=0;
							}
							out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
							}
							val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='none';");
							val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'none', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_none+"', 'yes');");

							for(i=0;i<30;i++){
								rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Female' and type_of_thyroid_disease='Not Applicable' and "+ch_symptoms[i]+"='no';");
								rs.next();
								child_f_sym[i]=rs.getInt(1);
								if(total_ch_f_none>0){
								child_f_sym_val[i]=rs.getFloat(1)/total_ch_f_none;
								}
								else{
									child_f_sym_val[i]=0;
								}
								out.println("\n"+child_f_sym[i]+"  :  "+child_f_sym_val[i]);
								}
								//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Female' and type_of_thyroid_disease='none';");
								val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'none', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Female', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_f_none+"', 'no');");

							
		//Obtaining number of patients having each symptom in children- Male
							//hypo
							for(i=0;i<30;i++){
								rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='hypothyroidism' and "+ch_symptoms[i]+"='yes';");
								rs.next();
								child_m_sym[i]=rs.getInt(1);
								if(total_ch_m_hypo>0){
								child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_hypo;
								}
								else{
									child_f_sym_val[i]=0;
								}
								out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
								}
								val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='hypo';");
								val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hypo', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_hypo+"', 'yes');");

								for(i=0;i<30;i++){
									rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='hypothyroidism' and "+ch_symptoms[i]+"='no';");
									rs.next();
									child_m_sym[i]=rs.getInt(1);
									if(total_ch_m_hypo>0){
									child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_hypo;
									}
									else{
										child_f_sym_val[i]=0;
									}
									out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
									}
									//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='hypo';");
									val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hypo', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_hypo+"', 'no');");

								
								//hyper
								for(i=0;i<30;i++){
									rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='hyperthyroidism' and "+ch_symptoms[i]+"='yes';");
									rs.next();
									child_m_sym[i]=rs.getInt(1);
									if(total_ch_m_hyper>0){
									child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_hyper;
									}
									else{
										child_f_sym_val[i]=0;
									}
									out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
									}
									val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='hyper';");
									val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hyper', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_hyper+"', 'yes');");

									for(i=0;i<30;i++){
										rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='hyperthyroidism' and "+ch_symptoms[i]+"='no';");
										rs.next();
										child_m_sym[i]=rs.getInt(1);
										if(total_ch_m_hyper>0){
										child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_hyper;
										}
										else{
											child_f_sym_val[i]=0;
										}
										out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
										}
										//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='hyper';");
										val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'hyper', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_hyper+"', 'no');");

									
									//goiter
									for(i=0;i<30;i++){
										rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='goiter' and "+ch_symptoms[i]+"='yes';");
										rs.next();
										child_m_sym[i]=rs.getInt(1);
										if(total_ch_m_goiter>0){
										child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_goiter;
										}
										else{
											child_f_sym_val[i]=0;
										}
										out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
										}
										val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='goiter';");
										val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'goiter', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_goiter+"', 'yes');");

										for(i=0;i<30;i++){
											rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='goiter' and "+ch_symptoms[i]+"='no';");
											rs.next();
											child_m_sym[i]=rs.getInt(1);
											if(total_ch_m_goiter>0){
											child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_goiter;
											}
											else{
												child_f_sym_val[i]=0;
											}
											out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
											}
											//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='goiter';");
											val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'goiter', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_goiter+"', 'no');");

										
										//cancer
										for(i=0;i<30;i++){
											rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='cancer' and "+ch_symptoms[i]+"='yes';");
											rs.next();
											child_m_sym[i]=rs.getInt(1);
											if(total_ch_m_cancer>0){
											child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_cancer;
											}
											else{
												child_f_sym_val[i]=0;
											}
											out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
											}
											val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='cancer';");
											val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'cancer', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_cancer+"', 'yes');");

											for(i=0;i<30;i++){
												rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='cancer' and "+ch_symptoms[i]+"='no';");
												rs.next();
												child_m_sym[i]=rs.getInt(1);
												if(total_ch_m_cancer>0){
												child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_cancer;
												}
												else{
													child_f_sym_val[i]=0;
												}
												out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
												}
												//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='cancer';");
												val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'cancer', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_cancer+"', 'no');");

											
											//none
											for(i=0;i<30;i++){
												rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='Not Applicable' and "+ch_symptoms[i]+"='yes';");
												rs.next();
												child_m_sym[i]=rs.getInt(1);
												if(total_ch_m_cancer>0){
												child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_none;
												}
												else{
													child_f_sym_val[i]=0;	
												}
												out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
												}
												val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='none';");
												val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'none', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_none+"', 'yes');");

												for(i=0;i<30;i++){
													rs= stmt.executeQuery("select count(*) from learning_child_symptoms where child_gender='Male' and type_of_thyroid_disease='Not Applicable' and "+ch_symptoms[i]+"='no';");
													rs.next();
													child_m_sym[i]=rs.getInt(1);
													if(total_ch_m_cancer>0){
													child_f_sym_val[i]=rs.getFloat(1)/total_ch_m_none;
													}
													else{
														child_f_sym_val[i]=0;	
													}
													out.println("\n"+child_m_sym[i]+"  :  "+child_f_sym_val[i]);
													}
													//val=stmt.executeUpdate("delete from child_symptoms where child_gender='Male' and type_of_thyroid_disease='none';");
													val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`child_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`, `total`, `value`) VALUES ('yes', 'none', '"+child_f_sym_val[0]+"', '"+child_f_sym_val[1]+"', '"+child_f_sym_val[2]+"', '"+child_f_sym_val[3]+"', '"+child_f_sym_val[4]+"', '"+child_f_sym_val[5]+"', '"+child_f_sym_val[6]+"', '"+child_f_sym_val[7]+"', '"+child_f_sym_val[8]+"', '"+child_f_sym_val[9]+"', '"+child_f_sym_val[10]+"', '"+child_f_sym_val[11]+"', '"+child_f_sym_val[12]+"', '"+child_f_sym_val[13]+"', '"+child_f_sym_val[14]+"', '"+child_f_sym_val[15]+"', '"+child_f_sym_val[16]+"', '"+child_f_sym_val[17]+"', '"+child_f_sym_val[18]+"', '"+child_f_sym_val[19]+"', '"+child_f_sym_val[20]+"', '"+child_f_sym_val[21]+"', '"+child_f_sym_val[22]+"', '"+child_f_sym_val[23]+"', '"+child_f_sym_val[24]+"', 'Male', '"+child_f_sym_val[25]+"', '"+child_f_sym_val[26]+"', '"+child_f_sym_val[27]+"', '"+child_f_sym_val[28]+"', '"+child_f_sym_val[29]+"', '"+total_ch_m_none+"', 'no');");

												
		//Obtaining number of patients having each symptom in infant
		String in_symptoms[]={"hereditary","medical_problems","poor_appetite","choking_while_nursing","failure_to_gain_weight_or_length","constipation","jaundice","trouble_breathing","hoarse_cry","sluggishness","enlarged_belly","cold_and_mottled_skin","dry_and_scaly_skin","poor_growth_of_hair_and_nails","delay_in_the_appearence_of_teeth","shorter_finger_and_toes","puffy_and_large_head","swollen_tongue","low_birth_weight","fast_heart_beat","high_blood_pressure","irritability","difficulty_in_sleeping","bulging_eyes","diarrhea","slowed_growth","intellectual_disability","hyper_activity"};
		
				//hypo
		for(i=0;i<28;i++){
			rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='hypothyroidism' and "+in_symptoms[i]+"='yes';");
			rs.next();
			infant_sym[i]=rs.getInt(1);
			if(total_in_hypo>0){
				infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
			}
			else{
				infant_sym_val[i]=0;
			}
			out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
			}
			val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='hypo';");
			val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'hypo', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_hypo+"', 'yes');");
			val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'hypo', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_hypo+"', 'yes');");

			for(i=0;i<28;i++){
				rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='hypothyroidism' and "+in_symptoms[i]+"='no';");
				rs.next();
				infant_sym[i]=rs.getInt(1);
				if(total_in_hypo>0){
					infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
				}
				else{
					infant_sym_val[i]=0;
				}
				out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
				}
				//val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='hypo';");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'hypo', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_hypo+"', 'no');");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'hypo', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_hypo+"', 'no');");

			
			//hyper
			for(i=0;i<28;i++){
				rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='hyperthyroidism' and "+in_symptoms[i]+"='yes';");
				rs.next();
				infant_sym[i]=rs.getInt(1);
				if(total_in_hypo>0){
					infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
				}
				else{
					infant_sym_val[i]=0;
				}
				out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
				}
				val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='hyper';");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'hyper', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_hyper+"', 'yes');");
				val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'hyper', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_hyper+"','yes');");

				for(i=0;i<28;i++){
					rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='hyperthyroidism' and "+in_symptoms[i]+"='no';");
					rs.next();
					infant_sym[i]=rs.getInt(1);
					if(total_in_hypo>0){
						infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
					}
					else{
						infant_sym_val[i]=0;
					}
					out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
					}
					//val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='hyper';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'hyper', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_hyper+"', 'no');");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'hyper', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_hyper+"','no');");

				
				//goiter
				for(i=0;i<28;i++){
					rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='goiter' and "+in_symptoms[i]+"='yes';");
					rs.next();
					infant_sym[i]=rs.getInt(1);
					if(total_in_hypo>0){
						infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
					}
					else{
						infant_sym_val[i]=0;
					}
					out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
					}
					val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='goiter';");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'goiter', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_goiter+"', 'yes');");
					val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'goiter', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_goiter+"', 'yes');");

					for(i=0;i<28;i++){
						rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='goiter' and "+in_symptoms[i]+"='no';");
						rs.next();
						infant_sym[i]=rs.getInt(1);
						if(total_in_hypo>0){
							infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
						}
						else{
							infant_sym_val[i]=0;
						}
						out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
						}
						//val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='goiter';");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'goiter', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_goiter+"', 'no');");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'goiter', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_goiter+"', 'no');");

					
					//cancer
					for(i=0;i<28;i++){
						rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='cancer' and "+in_symptoms[i]+"='yes';");
						rs.next();
						infant_sym[i]=rs.getInt(1);
						if(total_in_hypo>0){
							infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
						}
						else{
							infant_sym_val[i]=0;
						}
						out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
						}
						val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='cancer';");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'cancer', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_cancer+"', 'yes');");
						val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'cancer', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_cancer+"', 'yes');");

						for(i=0;i<28;i++){
							rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='cancer' and "+in_symptoms[i]+"='no';");
							rs.next();
							infant_sym[i]=rs.getInt(1);
							if(total_in_hypo>0){
								infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
							}
							else{
								infant_sym_val[i]=0;
							}
							out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
							}
							//val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='cancer';");
							val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'cancer', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_cancer+"', 'no');");
							val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'cancer', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_cancer+"', 'no');");

						
						//none
						for(i=0;i<28;i++){
							rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='Not Applicable' and "+in_symptoms[i]+"='yes';");
							rs.next();
							infant_sym[i]=rs.getInt(1);
							if(total_in_hypo>0){
								infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
							}
							else{
								infant_sym_val[i]=0;
							}
							out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
							}
							val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='none';");
							val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'none', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_none+"', 'yes');");
							val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'none', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_none+"', 'yes');");

							for(i=0;i<28;i++){
								rs= stmt.executeQuery("select count(*) from learning_infant_symptoms where type_of_thyroid_disease='Not Applicable' and "+in_symptoms[i]+"='no';");
								rs.next();
								infant_sym[i]=rs.getInt(1);
								if(total_in_hypo>0){
									infant_sym_val[i]=rs.getFloat(1)/total_in_hypo;
								}
								else{
									infant_sym_val[i]=0;
								}
								out.println("\n"+infant_sym[i]+"  :  "+infant_sym_val[i]);
								}
								//val=stmt.executeUpdate("delete from infant_symptoms where type_of_thyroid_disease='none';");
								val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'none', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Female', '"+total_in_none+"', 'no');");
								val=stmt.executeUpdate("INSERT INTO `thyrodictor`.`infant_symptoms` (`ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`, `total`, `value`) VALUES ('yes', 'none', '"+infant_sym_val[0]+"', '"+infant_sym_val[1]+"', '"+infant_sym_val[2]+"', '"+infant_sym_val[3]+"', '"+infant_sym_val[4]+"', '"+infant_sym_val[5]+"', '"+infant_sym_val[6]+"', '"+infant_sym_val[7]+"', '"+infant_sym_val[8]+"', '"+infant_sym_val[9]+"', '"+infant_sym_val[10]+"', '"+infant_sym_val[11]+"', '"+infant_sym_val[12]+"', '"+infant_sym_val[13]+"', '"+infant_sym_val[14]+"', '"+infant_sym_val[15]+"', '"+infant_sym_val[16]+"', '"+infant_sym_val[17]+"', '"+infant_sym_val[18]+"', '"+infant_sym_val[19]+"', '"+infant_sym_val[20]+"', '"+infant_sym_val[21]+"', '"+infant_sym_val[22]+"', '"+infant_sym_val[23]+"', '"+infant_sym_val[24]+"', '"+infant_sym_val[25]+"', '"+infant_sym_val[26]+"', '"+infant_sym_val[27]+"', 'Male', '"+total_in_none+"', 'no');");

							
							
							///////////==================================Learning ends=================/////////////////
									%>
									<script>alert("Learned from the dataset available in database - Posterior probability of symptoms and prior probabilities of disease class and symptoms are updated");</script>
									<%
									
			con.close();	
	}
}
catch(Exception ex){
	out.println("Exception: "+ex);
	%>
	<script>alert("Error!!!");</script>
	<%
}
	

%>


</head>
<body>
</body>
</html>