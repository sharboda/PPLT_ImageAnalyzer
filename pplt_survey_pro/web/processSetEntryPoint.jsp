
<%@page import="classes.Participants"%>
<%
    boolean veri = false;
     Participants pa=new Participants() ;
    String metric = request.getParameter("id");
   
       pa.setPid(metric );
    
    
    if(pa.ViewParticipantsByid()){
        
        if(pa.getType().equals("participant")){
            
            session.setAttribute("showMes", 1);
            session.setAttribute("mc", "Red");
                session.setAttribute("user", metric);
            session.setAttribute("message", pa.getFormMessage());
            response.sendRedirect("setParticipantQuestions.jsp");
        
        }else{
            session.setAttribute("user", metric);
        session.setAttribute("showMes", 1);
            session.setAttribute("mc", "Red");
            session.setAttribute("message", pa.getFormMessage());
            response.sendRedirect("setNewMetric.jsp");
        }
    
            
    }else{
    
             session.setAttribute("showMes", 1);
            session.setAttribute("mc", "Red");
            
            session.setAttribute("message", pa.getFormMessage());
            response.sendRedirect("index.jsp");
    
    }
        
       // index??
    
    
    
    
    
    
    
    
    
    
%>










