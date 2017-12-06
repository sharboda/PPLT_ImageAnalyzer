<%@page import="classes.Options"%>
<%@page import="classes.Metrics"%>
<%@page import="classes.Participants"%>
<%
    boolean veri = false;
    Options pa=new Options();
 
    String  option =request.getParameter("");
    
    if(request.getParameter("expe3")!=null && request.getParameter("expe2")!=null && request.getParameter("expe1")!=null && request.getParameter("events")!=null && request.getParameter("activities")!=null &&  request.getParameter("preferences")!=null){
    //out.print(request.getParameter("expe3")+"   "+request.getParameter("expe2"));
    }
        
// `qiop`, `mid`, `pid`, `optionname`, `ratings`, `choice`, `status`, `optionquestion`   
   
   // out.print("Act:"+request.getParameter("activities")+"   Event:"+request.getParameter("events")+"   Loc:"+request.getParameter("locations")+" Prefe:"+request.getParameter("preferences")+" Exp1:"+request.getParameter("expe1")+" expe2:"+request.getParameter("expe2")+" exp3:"+request.getParameter("expe3")+" acti"+request.getParameter("comment"));
    
    if(request.getParameter("activities")!=null){
        
    pa.setQiop(request.getParameter("activities").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
    pa.updateop();
     
    }
    
    if(request.getParameter("events")!=null){
    
    pa.setQiop(request.getParameter("events").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
     pa.updateop();
     
        
    }
    if(request.getParameter("locations")!=null){
       pa.setQiop(request.getParameter("locations").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
     pa.updateop();
        
    }
    
       if(request.getParameter("unique")!=null){
    pa.setQiop(request.getParameter("unique").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
     pa.updateop();
        
    }
    if(request.getParameter("expe1")!=null){
    pa.setQiop(request.getParameter("expe1").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
     pa.updateop();
        
    }
    if(request.getParameter("expe2")!=null){
    pa.setQiop(request.getParameter("expe2").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
        
    }
    
    if(request.getParameter("expe3")!=null){
    
    pa.setQiop(request.getParameter("expe3").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
    }
    if(request.getParameter("expe4")!=null){
    pa.setQiop(request.getParameter("expe4").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
        
    }
    if(request.getParameter("expe5")!=null){
    pa.setQiop(request.getParameter("expe5").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
        
    }
    if(request.getParameter("comment")!=null){
    
    pa.setQiop(request.getParameter("comment").toString());
    pa.setStatus("Closed");
    pa.setChoice(1);
    }
    
    response.sendRedirect("Welcome.jsp");
    
    
  /*
    if(pa.insertNewOptions()){
    
            session.setAttribute("showMes", 1);
            session.setAttribute("mc", "Red");
            session.setAttribute("message", pa.getFormMessage());
            response.sendRedirect("setNewAssignment.jsp");
    }
   */
        
        
    
    
    
    
    
    
    
    
    
    
%>