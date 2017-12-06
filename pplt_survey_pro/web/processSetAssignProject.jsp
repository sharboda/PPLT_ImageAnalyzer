<%@page import="classes.Options"%>
<%@page import="classes.Metrics"%>
<%@page import="classes.Participants"%>
<%
    boolean veri = false;
     Options pa=new Options();
    String metric = request.getParameter("metric");
    String patric= request.getParameter("part");
    String  opti = request.getParameter("option");

 String  ques = request.getParameter("ques");
    if (!metric.equals("") && !patric.equals("")&& !opti.equals("")){
        
    pa.setPid(patric);
    pa.setMid(metric);
    pa.setOptionname(opti);
    pa.setQues(ques);
    pa.setChoice(0);
    pa.setRatings(0);
    pa.setStatus("Open");
    
    
    if(pa.insertNewOptions()){
    
            session.setAttribute("showMes", 1);
            session.setAttribute("mc", "Red");
            session.setAttribute("message", pa.getFormMessage());
            response.sendRedirect("setNewAssignment.jsp");
    }
        
        
    }
    
    
    
    
    
    
    
    
    
%>