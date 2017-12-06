<%@page import="classes.Participants"%>
<%
    boolean veri = false;
     Participants  pa=new Participants();
    String id = request.getParameter("id");
    String name = request.getParameter("name");

    String locat = request.getParameter("loc");
    String gender = request.getParameter("gender");

    if (!id.equals("") && !name.equals("") && !locat.equals("") && !gender.equals("")){
        
    pa.setPid(id);
    pa.setGender(gender);
    pa.setName(name);
    pa.setLocation(locat);
    pa.setType("participant");
    pa.setStatus("Open");
    
    if(pa.insertNewPart()){
    
            session.setAttribute("showMes", 1);
            session.setAttribute("mc", "Red");
            session.setAttribute("message", pa.getFormMessage());
            response.sendRedirect("setNewParticipant.jsp");
    }
        
        
    }
    
    
    
    
    
    
    
    
    
%>