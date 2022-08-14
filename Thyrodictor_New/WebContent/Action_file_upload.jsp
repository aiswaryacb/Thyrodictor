<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACK</title>
    </head>
    <body>
        <% 
            
   //String name = request.getParameter("name");
   //String gen =request.getParameter("gen");
   //String course =request.getParameter("cou");
   //String branch = request.getParameter("branch");
   //String phn=request.getParameter("phn");
   //String username=request.getParameter("user");
   //String password=request.getParameter("pass");
   //String mail=request.getParameter("mailid");
   Connection con=null;
   Statement stmt=null;
try{
	out.println("hiiii");
       
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root","root");
    stmt=con.createStatement();
     String name1 = "";
                String gen="";
                String  branch = "";
                String phn = "";
                String username = "";
                String password = "";
                String mail = "";
    String s6 = "";
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                if (!isMultipart) {
                } else {
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);
                    List items = null;
                    try {
                        items = upload.parseRequest(request);
                    } catch (Exception e2) {
                        e2.getMessage();
                    }
                     Iterator itr = items.iterator();
                    while (itr.hasNext()) {
                        FileItem item = (FileItem) itr.next();
                        if (item.isFormField()) {
                            String name = item.getFieldName();
                            String value = item.getString();
                            if (name.equals("name1")) {
                                name1 = value;
                            }
                            if (name.equals("gen")) {
                                gen= value;
                            }
                            if (name.equals("branch")) {
                                branch= value;
                            }
                            if (name.equals("phn")) {
                                phn= value;
                            }
                            //if (name.equals("user")) {
                              //   username= value;
                         
                            
                            if (name.equals("mailid")) {
                                 mail= value;
                                
                            }
                            if (name.equals("pass")) {
                                 password= value;
                            }
                        } else {
                            try {
                                s6 = item.getName();
                                System.out.println("image" + s6);
                                File savedFile = new File("G:/CCS/MailApplicationCCS/web/Pic/" + s6);
                                
                                item.write(savedFile);
                            } catch (Exception e3) {
                                out.println("Error" + e3.getMessage());
                            }
                        }
                    }
    //int val = stmt.executeUpdate("INSERT INTO `sample`.`details` (`name`, `gen`, `course`, `branch`, `phone`, `username`, `password`,`mailid`) VALUES ('"+name1+"', '"+gen+"', '"+s6+"', '"+branch+"', '"+phn+"', '"+mail+"', '"+password+"','"+mail+"')");
    //if(val==1)
     //   response.sendRedirect("login.jsp");
   ///else
      //  response.sendRedirect("Formval.jsp");
                    
   //} catch(Exception e){response.sendRedirect("exp.jsp");} 
                String sql = "insert into `sample`.`details` (`name`, `gen`, `course`, `branch`, `phone`, `username`, `password`, `mailid`) VALUES (?,?,?,?,?,?,?,?)";
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setString(1, name1);
                pstmt.setString(2, gen);
                pstmt.setString(3, s6);
                 pstmt.setString(4, branch);
                pstmt.setString(5, phn);
                 pstmt.setString(6, mail);
                  pstmt.setString(7, password);
                    pstmt.setString(8, mail);
                pstmt.executeUpdate();
                response.sendRedirect("login.jsp");
                }
                     } catch (Exception e1) {
                e1.printStackTrace();
            }
%>

    </body>
  
</html>
