

<%@page import="classes.Metrics"%>
<%@page import="java.util.List"%>
<%@page import="classes.Participants"%>
<%

    
    

    if (session.getAttribute("message") == null) {
        session.setAttribute("message", "");

    }
    if (session.getAttribute("mc") == null) {
        session.setAttribute("mc", "");

    }
    if (session.getAttribute("showMes") == null) {
        session.setAttribute("showMes", 0);

    }
    int countLoad = Integer.parseInt(session.getAttribute("showMes") + "");
    countLoad++;
    int counter = 0;

     java.util.Random r = new java.util.Random();
            int accNo = r.nextInt(10);
            accNo *= 2;
            java.util.Random e = new java.util.Random();
            int accNo2 = e.nextInt(100);
            accNo2 += 2;
            java.util.Random ri = new java.util.Random();
            int accNo3 = ri.nextInt(10000);
            accNo3 += 3;
            String survid = "P-" + accNo+""+accNo2;

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>PPLT Survey Taking.: </h1>
        <center>
            <br/>
            <div>Menu</div>
            <h2><a href="setNewParticipant.jsp"><u>Set New Participants</u></a></h2>
        <h2><a href="setNewAssignment.jsp"><u>Set Survey Questions</u></a></h2>
         <h2><a href="setNewMetric.jsp"><u>Set Metric</u></a></h2>
        <h2><a href="settingSurvey.jsp"><u>Check Results</u></a></h2>
          <h2><a href="setNewParticipant.jsp"><u>Back To Main</u></a></h2>
        <hr/>
        <br/>
       
             
      
       
    
        <div>
            <h1>Action: Participation Id :</h1>
            <br/>
            <h3><%=session.getAttribute("message").toString()%></h3>
             <br/>
             <form action="processSetEntryPoint.jsp"  method="post">
                <table>
                    <tr>
                        
                           <td>
                            
                          Your Participant ID:  
                        </td>  
                        <td>
                            
                            <input type="text" name="id" value=""/>
                        </td> 
                        
                       
                        
      
                    </tr> 
              
                    <tr>

                        <td colspan="2"> <td/>
                             
                              <td>
                         <br/> <br/>
                         <input type="submit" value="Submit" name="Cancel" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Cancel" name />
                              </td>  
                        
                    </tr>
                    
                    
                </table>
            </form>
            
        </div>
        
        </center>
        
    </body>
</html>
