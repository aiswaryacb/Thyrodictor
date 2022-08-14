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
<meta http-equiv="Refresh" content="0;url=admin_update_learning_data.jsp">

<title>Insert title here</title>



<% 
try {
	String cellVal="'";
	int val;
	String un =(String)session.getAttribute("admin");
	String FileName = request.getParameter("FileName");
	String ageGrp = request.getParameter("ageGrp");
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
		InputStream ExcelFileToRead = new FileInputStream("C:\\Thyrodector\\Thyrodector\\DataSet\\"+FileName);
		if(ExcelFileToRead == null){
			%>
			<script type="text/javascript">alert("No such File exist in dataset folder!(C:\\Thyrodector\\Thyrodector\\DataSet)");</script>
			<%
			response.sendRedirect("admin_home.jsp");
		}
		XSSFWorkbook wb = new XSSFWorkbook(ExcelFileToRead);

		XSSFSheet sheet=wb.getSheetAt(0);
		XSSFRow row; 
		XSSFCell cell;

		Iterator rows = sheet.rowIterator();
		rows.next();//to skip title row
		int i=0;
		while (rows.hasNext())
		{
			/*if(i == 0)
			{	
				i++;
			}
			else{	
				cellVal = cellVal + ", '";
			}*/
			row=(XSSFRow) rows.next();
			Iterator cells = row.cellIterator();
			
			while (cells.hasNext())
			{
				cell=(XSSFCell) cells.next();
		
				if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
				{
					//System.out.print(cell.getStringCellValue()+" ");
					cellVal = cellVal + cell.getStringCellValue();
					cellVal = cellVal + "'";
					if(cells.hasNext()){
						cellVal = cellVal + ", '";
					}
				}
				else if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
				{
					System.out.print(cell.getNumericCellValue()+" ");
				}
				else
				{
					//U Can Handel Boolean, Formula, Errors
				}
			}
			//out.println(cellVal+"\n");
			if(ageGrp.equals("adult")){
				val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`learning_adult_symptoms` (`name`, `ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `palpitation`, `poor_concentration`, `memory_loss`, `difficulty_in_sleeping`, `excessive_need_for_sleep`, `fatigue`, `weak_muscles`, `sore_muscles`, `anxiety`, `depression`, `dry_skin`, `itchy_skin`, `unusual_hair_loss`, `dry_hair`, `peeling_nails`, `infrequent_bowel_movement`, `frequent_bowel_movement`, `unexplained_weight_gain`, `unexplained_weight_loss`, `persistant_pain_or_swelling`, `hoarseness`, `lump_in_the_throat`, `eye_pain_or_double_vision`, `swelling_of_eyes`, `change_in_facial_appearence`, `difficulty_in_tolerating_cold`, `excessive_sweating`, `hand_tremor`, `loss_of_appetite`, `trouble_swallowing`, `trouble_breathing`, `adult_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`) VALUES ("+cellVal+");");
				cellVal = "'";
			}
			else if(ageGrp.equals("children")){
				val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`learning_child_symptoms` (`child_name`, `ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `deceleration_of_growth`, `rough_dry_skin`, `constipation`, `cold_tolerance`, `fatigue`, `sleeping_more`, `brusing_easily`, `headache`, `vision_problems`, `early_or_delayed_puberty`, `emotional_liability`, `short_attension_span`, `finger_tremor`, `increased_appetite`, `weight_loss`, `swelling_at_the_front_of_neck`, `protruding_eyes`, `upper_eyelid_lag`, `infrequent_blinking`, `flushed_skin`, `excessive_sweating`, `muscle_weakness`, `palpitation`, `child_gender`, `loss_of_menstrual_periods`, `irregular_periods`, `excessive_menstrual_flow`, `miscarried`, `pms`) VALUES ("+cellVal+");");
				cellVal = "'";
			}else{
				val = stmt.executeUpdate("INSERT INTO `thyrodictor`.`learning_infant_symptoms` (`infant_name`, `ever_diagnosed_thyroid_disease`, `type_of_thyroid_disease`, `hereditary`, `medical_problems`, `poor_appetite`, `choking_while_nursing`, `failure_to_gain_weight_or_length`, `constipation`, `jaundice`, `trouble_breathing`, `hoarse_cry`, `sluggishness`, `enlarged_belly`, `cold_and_mottled_skin`, `dry_and_scaly_skin`, `poor_growth_of_hair_and_nails`, `delay_in_the_appearence_of_teeth`, `shorter_finger_and_toes`, `puffy_and_large_head`, `swollen_tongue`, `low_birth_weight`, `fast_heart_beat`, `high_blood_pressure`, `irritability`, `difficulty_in_sleeping`, `bulging_eyes`, `diarrhea`, `slowed_growth`, `intellectual_disability`, `hyper_activity`, `infant_gender`) VALUES ("+cellVal+");");
				cellVal = "'";
			}
		}
			System.out.println();
		//response.sendRedirect("admin_home.jsp");
		con.close();	
		%>
		<script type="text/javascript">alert("DataSet Updated Successfully");</script>
		<%

	}
}
	
catch(Exception ex){
	out.println("Exception \n\n"+ex);
	//response.sendRedirect("admin_home.jsp");
}
%>


</head>
<body>
</body>
</html>