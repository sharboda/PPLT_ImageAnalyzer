/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Metrics {
    private String mid,metric,formMessage;
    private Connection conn=null;

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMetric() {
        return metric;
    }

    public String getFormMessage() {
        return formMessage;
    }

    public void setFormMessage(String formMessage) {
        this.formMessage = formMessage;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public void setMetric(String metric) {
        this.metric = metric;
    }
    
   //================================
    

            
            
      public boolean insertNewMetrics() {
        try {

            conn = new ConnectorToDb().connector();
            //=================================================
            java.util.Random r = new java.util.Random();
            int accNo = r.nextInt(10);
            accNo *= 2;
            java.util.Random e = new java.util.Random();
            int accNo2 = e.nextInt(100);
            accNo2 += 2;
            java.util.Random ri = new java.util.Random();
            int accNo3 = ri.nextInt(10000);
            accNo3 += 3;
            mid = "M-" + accNo;
            //================================================
            String q = "INSERT INTO `metrics`(`mid`, `metric`) VALUES ('"+mid+"','"+metric+"')";
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
      
   //==================================================================================================
       public List<Metrics> ViewMetrics(){
        List<Metrics> myUserList = new ArrayList<Metrics>();
        try {
            conn = new ConnectorToDb().connector();
            String query = "select * from metrics";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {
           
               Metrics u= new Metrics();
         //`attendance_id`, `attendance_code`, `atttimes`, `person_id`, `donedate`, `mark_attendance`, `status`, `type`
                u.setMid(re.getString(1));
                u.setMetric(re.getString(2));
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
    
}
