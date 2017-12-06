



<%@page import="java.util.List"%>
<%@page import="classes.Options"%>
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
            String survid = "M-" + accNo;

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
        <style media="all" type="text/css">
            @import "css/all.css";
        </style>
    
        
         <link rel="stylesheet" type="text/css" href="dataTables/css/jquery.dataTables.css"/>
        <script type="text/javascript" src="dataTables/js/jQuery.js"></script>
        <script type="text/javascript" src="dataTables/js/jquery.dataTables.js"></script>

        
        <script>

            $(document).ready(function() {
                // alert(); 


                $("#myDemo").DataTable();



            });

        </script>
        <script src="Reports/repo.js"></script>
       
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
            <h1>Results</h1>
            <br/>
           
            <center><a href="javascript:void(0)" Style="border-color: red;" class="btn btn-primary" onclick="getalldata('#elem')"><span>PRINT</span> </u></a></center>
            
            <table border="1" style="background-color: #19A15F; color: #D6DB2F" id="myDemo">
                    
                    <thead>
                        
                        <tr>
      
                        <th>#</th>
                        <th>Question_ID</th>
                        <th>Metric_ID</th>
                        <th>Participant_ID</th>
                        <th>Option</th>
                        <th>Ratings</th>
                        <th>Choice</th>
                        <th>Status</th>
                        <th>Metric</th>
                        <th>Participant</th>
                        <th>Location</th>
                         <th>Gender</th>
                           <th>Question</th>
                        </tr>
                        
                        
                    </thead>
                    <tbody id="elem">
                        
                        
                        
                 
                    
                    
                    <%
                    Options pa30= new Options();
                        pa30.setPid(session.getAttribute("user").toString());
                         
                        List<Options> plist30 = pa30.ViewQOP();
                        
                        if(plist30.size()!=0){
                         
                            int row=0;
                        
                        while(row<plist30.size()){
                        
                        %>
                    
                        <tr style="color: black">
                          <td><%= row+1%></td>
                          <td><%=plist30.get(row).getQiop() %></td>
                        <td><%=plist30.get(row).getMid() %></td>
                        <td><%=plist30.get(row).getPid() %></td>
                        <td><%=plist30.get(row).getOptionname() %></td>
                        <td><%=plist30.get(row).getRatings()%></td>
                        <td><%=plist30.get(row).getChoice()%></td>
                        <td><%=plist30.get(row).getStatus() %></td>
                        <td><%=plist30.get(row).getMetric() %></td>
                        <td><%=plist30.get(row).getName() %></th>
                        <td><%=plist30.get(row).getLocati()%></td>
                         <td><%=plist30.get(row).getGender() %></td>
                         <td><%=plist30.get(row).getQues()%></td>
                    
                    </tr>
                    
                    
                    
                    <%
                            
                            
                        row++;
                        }
                        
                        }
                    
                    %>
                    <tr>
                        
                       
                        

                    </tr>
                       </tbody >
                    
                   
                </table>
          
            
        </div>
        
        </center>
        
    </body>
</html>
