<%@page import="classes.Metrics"%>
<%@page import="classes.Participants"%>
<%
    boolean veri = false;
     Metrics  pa=new Metrics();
    String id = request.getParameter("id");
    String name = request.getParameter("metric");


    if (!id.equals("") && !name.equals("")){
        
    pa.setMid(id);
    pa.setMetric(name);
    
    
    if(pa.insertNewMetrics()){
    
            session.setAttribute("showMes", 1);
            session.setAttribute("mc", "Red");
            session.setAttribute("message", pa.getFormMessage());
            response.sendRedirect("setNewMetric.jsp");
    }
        
        
    }
    
    
    
    
    
    
    
    
    
%>