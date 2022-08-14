package backup;
import java.io.*;
import java.security.*;
public class backupDbtoSql {
	public static boolean Backupdbtosql() {
	    try {

	        /*NOTE: Getting path to the Jar file being executed*/
	        /*NOTE: YourImplementingClass-> replace with the class executing the code*/
	        CodeSource codeSource = backupDbtoSql.class.getProtectionDomain().getCodeSource();
	        File jarFile = new File(codeSource.getLocation().toURI().getPath());
	        String jarDir = jarFile.getParentFile().getPath();


	        /*NOTE: Creating Database Constraints*/
	        String dbName = "jdbc:mysql://localhost:3306/thyrodictor";
	        String dbUser = "root";
	        String dbPass = "root";

	        /*NOTE: Creating Path Constraints for folder saving*/
	        /*NOTE: Here the backup folder is created for saving inside it*/
	        String folderPath = "E:\\backup";

	        /*NOTE: Creating Folder if it does not exist*/
	        File f1 = new File(folderPath);
	        f1.mkdir();

	        /*NOTE: Creating Path Constraints for backup saving*/
	        /*NOTE: Here the backup is saved in a folder called backup with the name backup.sql*/
	         String savePath = "E:\\backup\thyrodictor_backup.sql\"";

	        /*NOTE: Used to create a cmd command*/
	        //String executeCmd = "mysqldump -u" + dbUser + " -p" + dbPass + " --database " + dbName + " -r " + savePath;
	         String executeCmd = "<Path to MySQL>/bin/mysqldump -u " + dbUser + " -p" + dbPass + " --add-drop-database -B " + dbName + " -r " + savePath;

	        /*NOTE: Executing the command here*/
	        Process runtimeProcess = Runtime.getRuntime().exec(executeCmd);
	        int processComplete = runtimeProcess.waitFor();

	        /*NOTE: processComplete=0 if correctly executed, will contain other values if not*/
	        if (processComplete == 0) {
	            System.out.println("Backup Complete");
	            return true;
	        } else {
	            System.out.println("Backup Failure");
	            return false;
	        }

	    } catch (Exception ex) {
	        //JOptionPane.showMessageDialog(null, "Error at Backuprestore" + ex.getMessage());
	    	System.out.println("Exception "+ex);
	    	//echo %PATH%
	    	return false;
	    }
	}
}
