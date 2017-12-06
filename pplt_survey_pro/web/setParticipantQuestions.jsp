

<%@page import="classes.Options"%>
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
    String survid = "P-" + accNo + "" + accNo2;

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
         <center>
        <h1>Survey Questionnaire:</h1>
   

        <div>Taking Survey..</div>
        <hr/>
     
 
        
        <br/>
        
        <p><h3>This survey is about pictures you’ve posted on a social media site like Facebook or Instagram.</h3></p> 
<p><h3>Please note that neither names nor photos will be shared with anyone else and neither will they appear in the report</h3></p>

        
        <p><h3>From the photos you have posted, the following your children can be inferred please tick those inferences that you believe to be correct
</h3></p>
        <hr/>
        <div>
            <h1>Question List:</h1>
            <br/>
            <h3><%=session.getAttribute("message").toString()%></h3>
            <br/>
            <form action="processSetCount.jsp"  method="post">
                <table>
                    
                    
                                      
 <%                            
                        
                        Options pa6 = new Options();

                            pa6.setPid(session.getAttribute("user").toString());
                            List<Options> plist6= pa6.ViewQOPbyone();
                            int q6= 0;
                              //int q = 0;
                            if (plist6.size()!= 0) {
                                int row6 = 0;

                                while (row6 < plist6.size()) {

                                    if (plist6.get(row6).getMetric().equals("Events")) {

                                        
                                        if (q6 == 0) {
q6= 1;

                        %>

                        

                    
<tr>

                         <td><p>1.<%=plist6.get(row6).getQues()%></p> </td>


</tr>




                    





                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>

                              <input type="radio" name="events" value="<%=plist6.get(row6).getQiop()%>"><%=plist6.get(row6).getOptionname()%>
                             
                          </td>


</tr>

                        
                        
                        <%

                                }

                                row6++;
                            }

                        }


                    %>

                 







                    </tr> 
                     
                    
                    
                                       
 <%                            
                        
                        Options pa5 = new Options();

                            pa5.setPid(session.getAttribute("user").toString());
                            List<Options> plist5= pa5.ViewQOPbyone();
                            int q5= 0;
                              //int q = 0;
                            if (plist5.size()!= 0) {
                                int row5 = 0;

                                while (row5 < plist5.size()) {

                                    if (plist5.get(row5).getMetric().equals("Activities")) {

                                        
                                        if (q5== 0) {
q5= 1;

                        %>

                        

                    
<tr>

                         <td><p>2.<%=plist5.get(row5).getQues()%></p> </td>


</tr>




                    





                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>
                              

                              <input type="radio" name="activities" value="<%=plist5.get(row5).getQiop()%>"><%=plist5.get(row5).getOptionname()%>
                             
                          </td>


</tr>

                        
                        
                        <%

                                }

                                row5++;
                            }

                        }


                    %>

                 







                    </tr> 
                    
                   
 <%                            
                        
                        Options pa4 = new Options();

                            pa4.setPid(session.getAttribute("user").toString());
                            List<Options> plist4= pa4.ViewQOPbyone();
                            int q4= 0;
                              //int q = 0;
                            if (plist4.size()!= 0) {
                                int row4 = 0;

                                while (row4 < plist4.size()) {

                                    if (plist4.get(row4).getMetric().equals("Locations")) {

                                        
                                        if (q4 == 0) {
q4= 1;

                        %>

                        

                    
<tr>

                         <td><p>3.<%=plist4.get(row4).getQues()%></p> </td>


</tr>




                    





                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>

                              <input type="radio" name="locations" value="<%=plist4.get(row4).getQiop()%>"><%=plist4.get(row4).getOptionname()%>
                             
                          </td>


</tr>

                        
                        
                        <%

                                }

                                row4++;
                            }

                        }


                    %>

                 







                    </tr> 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                   <%                            
                        
                        Options pa3= new Options();

                            
                        pa3.setPid(session.getAttribute("user").toString());
                          
                        List<Options> plist3 = pa3.ViewQOPbyone();
                            int q3= 0;
                              //int q = 0;
                            if (plist3.size()!= 0) {
                                int row3 = 0;

                                while (row3 < plist3.size()) {

                                    if (plist3.get(row3).getMetric().equals("Preferences")) {

                                        
                                        if (q3== 0) {
           q3= 1;

                        %>

                        

                    
<tr>

                        <td><p>4.<%=plist3.get(row3).getQues()%></p> </td>


</tr>




                    





                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>
                              

                              <input type="radio" name="preferences" value="<%=plist3.get(row3).getQiop()%>"><%=plist3.get(row3).getOptionname()%>
                             
                          </td>


</tr>

                        
                        
                        <%

                                }

                                row3++;
                            }

                        }


                    %>

                 






         
                    
                   <%                            
                        
                        Options pa30= new Options();

                            
                        pa30.setPid(session.getAttribute("user").toString());
                          
                        List<Options> plist30 = pa30.ViewQOPbyone();
                            int q30= 0;
                              //int q = 0;
                            if (plist30.size()!= 0) {
                                int row30 = 0;

                                while (row30 < plist30.size()) {

                                    if (plist30.get(row30).getMetric().equals("Unique")) {

                                        
                                        if (q30== 0) {
           q30= 1;

                        %>

                        

                    
<tr>

                        <td><p>4.<%=plist30.get(row30).getQues()%></p> </td>


</tr>




                    





                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>
                              

                              <input type="radio" name="unique" value="<%=plist30.get(row30).getQiop()%>"><%=plist30.get(row30).getOptionname()%>
                             
                          </td>


</tr>

                        
                        
                        <%

                                }

                                 row30++;
                            }

                        }


                    %>

                 
                     
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                  
                    
                  
                    
                     <%                            
                        
                        Options pa11 = new Options();

                            pa11.setPid(session.getAttribute("user").toString());
                            List<Options> plist11 = pa11.ViewQOPbyone();
                            int q11=0;
                              //int q = 0;
                            if (plist11.size()!= 0) {
                                int row11= 0;

                                while (row11< plist11.size()) {

                                    if (plist11.get(row11).getMetric().equals("Expectation Rating 1")) {

                                        
                                        if (q11== 0) {
q11= 1;

                        %>

                        

                   
<tr>
   

                        <td>
                             <p><%=plist11.get(row11).getQues()%></p>
                             <p><%=plist11.get(row11).getOptionname()%></p>  
                            
                        </td>


</tr>


                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>
                             
                              <input type="radio" name="expe1" value="1">1
                                   <input type="radio" name="expe1" value="1">2
                                         <input type="radio" name="expe1" value="1">3
                                               <input type="radio" name="expe1" value="1">4
                                                     <input type="radio" name="expe1" value="1">5
                          </td>


</tr>

                        
                        
                        <%

                                }

                                row11++;
                            }

                        }


                    %>

                 







                   
                    
                    
                    
                    
                    
                    
                    

                        <%                            
                        
                        Options pa22= new Options();

                            pa22.setPid(session.getAttribute("user").toString());
                            List<Options> plist22 = pa22.ViewQOPbyone();
                            int q22 = 0;
                              //int q = 0;
                            if (plist22.size()!= 0) {
                                int row22 = 0;

                                while (row22 < plist22.size()) {

                                    if (plist22.get(row22).getMetric().equals("Expectation Rating 2")) {

                                        
                                        if (q22== 0) {
q22= 1;

                        %>

                        

                    
<tr>

                       
<td>
 <p><%=plist22.get(row22).getQues()%></p>
 <p><%=plist22.get(row22).getOptionname()%></p> </td>
</tr>




                    





                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>

                               <input type="radio" name="expe2" value="1">1
                                   <input type="radio" name="expe2" value="1">2
                                         <input type="radio" name="expe2" value="1">3
                                               <input type="radio" name="expe2" value="1">4
                                                     <input type="radio" name="expe2" value="1">5
                                                    
                          </td>


</tr>

                        
                        
                        <%

                                }

                                row22++;
                            }

                        }


                    %>

                 







                   

                    

                        <%                            
                        
                        Options pa19 = new Options();

                            pa19.setPid(session.getAttribute("user").toString());
                            List<Options> plist19= pa19.ViewQOPbyone();
                            int q19 = 0;
                              //int q = 0;
                            if (plist19.size()!= 0) {
                                int row19 = 0;

                                while (row19 < plist19.size()) {

                                    if (plist19.get(row19).getMetric().equals("Expectation Rating 3")) {

                                        
                                        if (q19== 0) {
q19= 1;

                        %>

                        

                    
<tr>

                        
   <td>
       <p><%=plist19.get(row19).getQues()%></p>
       <p><%=plist19.get(row19).getOptionname()%></p>
   
   </td>


</tr>




                    





                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>

                              <input type="radio" name="expe3" value="<%=plist19.get(row19).getQiop() %>">1
                                   <input type="radio" name="expe3" value="<%=plist19.get(row19).getQiop() %>">2
                                         <input type="radio" name="expe3" value="<%=plist19.get(row19).getQiop() %>">3
                                               <input type="radio" name="expe3" value="<%=plist19.get(row19).getQiop() %>">4
                                                     <input type="radio" name="expe3" value="<%=plist19.get(row19).getQiop()%>">5
                                                     
                                                     
                             
                          </td>


</tr>

                        
                        
                        <%

                                }

                                row19++;
                            }

                        }


                    %>

                 







                   
                    
                    

                        <%                            
                        
                        Options pa8 = new Options();

                            pa8.setPid(session.getAttribute("user").toString());
                            List<Options> plist8 = pa8.ViewQOPbyone();
                            int q8 = 0;
                              //int q = 0;
                            if (plist8.size()!= 0) {
                                int row8 = 0;

                                while (row8 < plist8.size()) {

                                    if (plist8.get(row8).getMetric().equals("Expectation Rating 4")) {

                                        
                                        if (q8== 0) {
q8 = 1;

                        %>

                        

                    
<tr>

                        <td><p><%=plist8.get(row8).getQues()%></p> </td>


</tr>




                    





                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>

                               <input type="radio" name="expe4" value="<%=plist8.get(row8).getQiop()%>">1
                                   <input type="radio" name="expe4" value="<%=plist8.get(row8).getQiop()%>">2
                                         <input type="radio" name="expe4" value="<%=plist8.get(row8).getQiop()%>">3
                                               <input type="radio" name="expe4" value="<%=plist8.get(row8).getQiop()%>">4
                                                     <input type="radio" name="expe4" value="<%=plist8.get(row8).getQiop()%>">5
                             
                          </td>
                          
                           


</tr>

                        
                        
                        <%

                                }

                                row8++;
                            }

                        }


                    %>

 

                      <%                            
                        
                        Options pa9= new Options();

                            pa9.setPid(session.getAttribute("user").toString());
                            List<Options> plist9= pa9.ViewQOPbyone();
                            int q9=0;
                              //int q = 0;
                            if (plist9.size()!= 0) {
                                int row9= 0;

                                while (row9< plist9.size()) {

                                    if (plist9.get(row9).getMetric().equals("Expectation Rating 5")) {

                                        
                                        if (q9== 0) {
q9 = 1;

                        %>

                        

                    
<tr>

                        <td><p><%=plist9.get(row9).getQues()%></p> </td>


</tr>




                    





                    <%
                                    }
                                        
                                        %>
                    
                        <tr>

                          <td>

                               <input type="radio" name="expe5" value="<%=plist9.get(row9).getQiop()%>">1
                                   <input type="radio" name="expe5" value="<%=plist9.get(row9).getQiop()%>">2
                                         <input type="radio" name="expe5" value="<%=plist9.get(row9).getQiop()%>">3
                                               <input type="radio" name="expe5" value="<%=plist9.get(row9).getQiop()%>">4
                                                     <input type="radio" name="expe5" value="<%=plist9.get(row9).getQiop()%>">5
                                                     
                                                      
                              
                             
                          </td>


</tr>

                        
                        
                        <%

                                }

                                row9++;
                            }

                        }


                    %>

                 







                  
                   
                   
                     <%                            
                        
                        Options pa10= new Options();

                            pa10.setPid(session.getAttribute("user").toString());
                            List<Options> plist10= pa10.ViewQOPbyone();
                            int q10=0;
                              //int q = 0;
                            if (plist10.size()!= 0) {
                                int row10= 0;

                                while (row10< plist10.size()) {

                                    if (plist10.get(row10).getMetric().equals("Comment")) {

                                        
                                        if (q10== 0) {
q10= 1;

                        %>

                        

                    
<tr>
                        <td><p><%=plist10.get(row10).getQues()%></p> </td>


</tr>




                    





                    <%
                                 



%>
                    

 <tr>

                          <td>
                              <textarea name="comment" rows="4" cols="120">
                 </textarea>
                              
                              
                              
                        
                          </td>


</tr>



<%   }
                                        
                                        
                    
                       
                        
                        
                  

                                }

                                row10++;
                            }

                        }


                    %>

                 







                    
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
