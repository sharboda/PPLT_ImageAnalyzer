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
        
        
         <link rel="stylesheet" type="text/css" href="../dataTables/css/jquery.dataTables.css"/>
        <script type="text/javascript" src="../dataTables/js/jQuery.js"></script>
        <script type="text/javascript" src="../dataTables/js/jquery.dataTables.js"></script>

        
        
        <script>

            $(document).ready(function() {
                // alert(); 
                $("#myDemo").DataTable();

            });

        </script>
        
        <script src="Reports/report.js"></script>
    </head>
    
     
    <body>
        <h1>Survey Setting</h1>
        <center>
     
            <div>Menu</div>
        <hr/>
        
        <br/>
        
         <h2>Thank you for taking this survey....</h2>
       
             
        <hr/>
        <br/> <br/>
        
      
        
        </center>
        
    </body>
</html>
