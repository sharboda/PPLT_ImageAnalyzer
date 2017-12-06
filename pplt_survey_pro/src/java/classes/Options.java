
package classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class Options {
    private String qiop, mid,pid,ques,gender, optionname,status,formMessage,name,metric,locati;
    private int ratings,choice;
      private Connection conn=null;

    public String getQiop() {
        return qiop;
    }
    public String getGender() {
        return gender;
    }

    public String getQues() {
        return ques;
    }

    public void setQues(String ques) {
        this.ques = ques;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setQiop(String qiop) {
        this.qiop = qiop;
    }

    public String getMid() {
        return mid;
    }

    public String getLocati() {
        return locati;
    }

    public void setLocati(String locati) {
        this.locati = locati;
    }

    public String getFormMessage() {
        return formMessage;
    }

    public void setFormMessage(String formMessage) {
        this.formMessage = formMessage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMetric() {
        return metric;
    }

    public void setMetric(String metric) {
        this.metric = metric;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getOptionname() {
        return optionname;
    }

    public void setOptionname(String optionname) {
        this.optionname = optionname;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRatings() {
        return ratings;
    }

    public void setRatings(int ratings) {
        this.ratings = ratings;
    }

    public int getChoice() {
        return choice;
    }

    public void setChoice(int choice) {
        this.choice = choice;
    }
   
   //==================================================    
      public boolean insertNewOptions() {
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
            qiop = "Q-" + accNo;
            //================================================
            String q = "INSERT INTO `qoptions`(`qiop`, `mid`, `pid`, `optionname`, `ratings`, `choice`, `status`,`optionquestion`) VALUES ('"+qiop+"', '"+mid+"','"+pid+"','"+optionname+"','"+ratings+"','"+choice+"','"+status+"','"+ques+"')";
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
      
      //========================================================
      
      public boolean updateop() {
        try {

            conn = new ConnectorToDb().connector();
          
            String q = "UPDATE `qoptions` SET `ratings`='"+ratings+"',`choice`='"+choice+"',`status`='"+status+"' WHERE `qiop`='"+qiop+"'";
            Statement pst = conn.createStatement();
            
            if(pst.executeUpdate(q)==1){
             formMessage="1 Row is Updated";
            }else{
            
             formMessage="1 Row is not Updated";
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
      
      
      //========================================================================
        public List<Options> ViewQOP() {
        List<Options> myUserList = new ArrayList<Options>();
        try {
            conn = new ConnectorToDb().connector();
            
            String query ="SELECT o.qiop,o.mid,o.pid, o.optionname, o.ratings, o.choice, o.status, m.metric,p.name,p.location,p.gender,o.optionquestion FROM qoptions o,metrics m, participants p WHERE o.pid=p.pid and  o.mid=m.mid";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {
 
                Options u= new Options();
             
                u.setQiop(re.getString(1));
                u.setMid(re.getString(2));
                u.setPid(re.getString(3));
                u.setOptionname(re.getString(4));
                u.setRatings(re.getInt(5));
                u.setChoice(re.getInt(6));
                u.setStatus(re.getString(7));
                u.setMetric(re.getString(8));
                u.setName(re.getString(9));
                u.setLocati(re.getString(10));
                u.setGender(re.getString(11));
                 u.setQues(re.getString(12));
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

  

   //===========================================================
      public List<Options> ViewQOPbyone() {
        List<Options> myUserList = new ArrayList<Options>();
        try {
            conn = new ConnectorToDb().connector();
            
            String query ="SELECT o.qiop,o.mid,o.pid, o.optionname, o.ratings, o.choice, o.status, m.metric,p.name,p.location,p.gender,o.optionquestion FROM qoptions o,metrics m, participants p WHERE o.pid=p.pid and  o.mid=m.mid and o.pid='"+pid+"'";
            Statement stm = conn.createStatement();
            ResultSet re = stm.executeQuery(query);
            while (re.next()) {
 
                Options u= new Options();
             
                u.setQiop(re.getString(1));
                u.setMid(re.getString(2));
                u.setPid(re.getString(3));
                u.setOptionname(re.getString(4));
                u.setRatings(re.getInt(5));
                u.setChoice(re.getInt(6));
                u.setStatus(re.getString(7));
                u.setMetric(re.getString(8));
                u.setName(re.getString(9));
                u.setLocati(re.getString(10));
                u.setGender(re.getString(11));
                u.setQues(re.getString(12));
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
