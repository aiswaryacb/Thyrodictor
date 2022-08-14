package backup;
import java.io.*;
import java.security.*;
public class restoreSqltoDb {
	public static boolean Restoredbfromsql(String s) {
        try {
            /*NOTE: String s is the mysql file name including the .sql in its name*/
            /*NOTE: Getting path to the Jar file being executed*/
            /*NOTE: YourImplementingClass-> replace with the class executing the code*/
            CodeSource codeSource = restoreSqltoDb.class.getProtectionDomain().getCodeSource();
            File jarFile = new File(codeSource.getLocation().toURI().getPath());
            String jarDir = jarFile.getParentFile().getPath();

            /*NOTE: Creating Database Constraints*/
            String dbName = "thyrodictor";
	        String dbUser = "root";
	        String dbPass = "root";
            /*NOTE: Creating Path Constraints for restoring*/
            String restorePath = "E:\\backup" + "\\" + s;

            /*NOTE: Used to create a cmd command*/
            /*NOTE: Do not create a single large string, this will cause buffer locking, use string array*/
            String[] executeCmd = new String[]{"mysql", dbName, "-u" + dbUser, "-p" + dbPass, "-e", " source " + restorePath};

            /*NOTE: processComplete=0 if correctly executed, will contain other values if not*/
            Process runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();

            /*NOTE: processComplete=0 if correctly executed, will contain other values if not*/
            if (processComplete == 0) {
                //JOptionPane.showMessageDialog(null, "Successfully restored from SQL : " + s);
            	System.out.println("Restore Complete");
	            return true;
            } else {
                //JOptionPane.showMessageDialog(null, "Error at restoring");
            	System.out.println("Restore failed");
	            return false;
            }


        } catch (Exception ex) {
            //JOptionPane.showMessageDialog(null, "Error at Restoredbfromsql" + ex.getMessage());
        	return false;
        }

    }
}
