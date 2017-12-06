
package classes;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectorToDb {
    
 public Connection connector(){
 Connection con=null;
     try {
        
    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
    
  con=DriverManager.getConnection("jdbc:mysql://localhost/surveydb","root","");
      
        
     } catch (Exception e) {
         con=null;
         
     }
 return con;
 }   
    
}
