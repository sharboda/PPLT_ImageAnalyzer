
package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Participants {
    private String pid,location,name,gender,status,type,formMessage;
     private Connection conn=null;

    public String getPid() {
        return pid;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getFormMessage() {
        return formMessage;
    }

    public void setFormMessage(String formMessage) {
        this.formMessage = formMessage;
    }
    
  //===================
    
      public boolean insertNewPart() {
        try {

            conn = new ConnectorToDb().connector();
            //=================================================
       
            //================================================
            String q = "INSERT INTO `participants`(`pid`, `location`, `name`, `gender`, `status`, `type`) VALUES ('"+pid+"', '"+location+"', '"+name+"','"+gender+"','"+status+"','"+type+"')";
            Statement pst = conn.createStatement();
            
            if(pst.executeUpdate(q)==1){
             formMessage="1 Row is Added";
            }else{
            
             formMessage="no Row added";
            }
           
            //===========================
            pst.close();
            conn.close();
            //=================================
            return true;

        } catch (Exception e) {
            formMessage = e.getMessage();
            return false;

        }

    }
      
      
      //=====================================================================================
      
        public List<Participants> ViewParticipants(){
        List<Participants> myUserList = new ArrayList<Participants>();
        try {
            conn = new ConnectorToDb().connector();
            String query = "select * from participants";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {
           
               Participants u= new Participants();
         //`attendance_id`, `attendance_code`, `atttimes`, `person_id`, `donedate`, `mark_attendance`, `status`, `type`
                u.setPid(re.getString(1));
                u.setLocation(re.getString(2));
                u.setName(re.getString(3));
                u.setGender(re.getString(4));
                u.setStatus(re.getString(5));
                u.setType(re.getString(6));
               // `pid`, `location`, `name`, `gender`, `status`, `type`
                myUserList.add(u);
            }
            
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage="Error:"+e.getMessage();
        }

        return myUserList;

    }
        
        
        //=================================================================
        
        
        public boolean ViewParticipantsByid(){
            
            boolean vv=false;
        List<Participants> myUserList = new ArrayList<Participants>();
        try {
            conn = new ConnectorToDb().connector();
            String query = "select * from participants where pid='"+pid+"'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {
           
         //`attendance_id`, `attendance_code`, `atttimes`, `person_id`, `donedate`, `mark_attendance`, `status`, `type`
                type=re.getString(6);
                status=re.getString(5);
                name=re.getString(3);
                location=re.getString(2);
                vv=true;
               
            }
            
            re.close();
            stm.close();
            conn.close();

        } catch (Exception e) {
            formMessage="Error:"+e.getMessage();
        }

     return vv;

    }
    
    
}
