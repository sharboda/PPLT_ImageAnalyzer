

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
        <h1>Survey Setting</h1>
        <center>
            
            <div>Menu</div>
        <hr/>
        <br/>
        <h2><a href="setNewParticipant.jsp"><u>Set New Participants</u></a></h2>
        <h2><a href="setNewAssignment.jsp"><u>Set Survey Questions</u></a></h2>
         <h2><a href="setNewMetric.jsp"><u>Set Metric</u></a></h2>
        <h2><a href="settingSurvey.jsp"><u>Check Results</u></a></h2>
        <h2><a href="index.jsp"><u>Back To Main</u></a></h2>
        <hr/>
        <br/> <br/>
        
        <div>
            <h1>Action: Assignment Survey Questions..:</h1>
            <br/>
            <h3><%=session.getAttribute("message").toString() %></h3>
             <br/>
             <form action="processSetAssignProject.jsp"  method="post">
                <table>
                    <tr>
                        
                         <td>
                            
                          Participant:  
                        </td>  
                        <td>
                            <select name="part">
                                
                                <%
                                
                                Participants pa=new Participants();
                                List<Participants>plist=pa.ViewParticipants();
                                
                                if(plist.size()!=0){
                                int i=0;
                                while(i<plist.size()){
                 
                                %>
                                
                                <option value="<%=plist.get(i).getPid()%>"><%=plist.get(i).getName()+","+plist.get(i).getLocation()+","+plist.get(i).getPid()%></option>
                                
                                
                                <%
                                
                                
                                i++;
                                }
                                
                                
                                }
                                
                                
                                
                                %>
                               
                               
                            </select>
                          
                        </td> 
                        
                         <td>
                            
                           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Metric:  
                        </td>  
                        <td>
                            <select name="metric">
                                
                                <%
                                
                                 Metrics pa1=new Metrics();
                                List<Metrics>plist1=pa1.ViewMetrics();
                                
                                if(plist1.size()!=0){
                                int i=0;
                                while(i<plist1.size()){
                 
                                %>
                                
                                <option value="<%=plist1.get(i).getMid()%>"><%=plist1.get(i).getMetric()%></option>
                                
                                
                                <%
                                
                                
                                i++;
                                }
                                
                                
                                }
                                
                                
                                
                                %>
                               
                               
                            </select>
                          
                        </td>  
                        
                     
                        
                    </tr> 
                    <br/>
                   
                     <tr>
                        
                       
                        
                       
                        
                         <td>What We found:</td>
                        <td>
                      
                        <textarea name="option" rows="4" cols="50"></textarea>     
                        </td>
                   
                         <br/><br/>
                         <td>Question:</td>
                        <td>
                          
                        <textarea name="ques" rows="4" cols="50"></textarea>     
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
