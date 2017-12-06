function getalldata(elem)
{
    //alert();
    PopupRep($(elem).html());
}
function PopupRep(data)
{
    // alert(data); 


  
    
    var printCart = window.open('', 'PPLT');
    printCart.document.write('<html><head><title>Survey Report</title>');
    printCart.document.write('<style> table{ border: solid 1px black; width:670px; border-collapse: collapse; }   </style></head><body >');
    printCart.document.write('<span style="color:blue;font-size:9pt"><center>COure Attendance</center></span>');
    printCart.document.write('</br>');
    printCart.document.write('<img  width="50" src="" alt=""/>');
    
    printCart.document.write('<center><span style="color:green;font-size:15pt">Survey Replies</span></center>');
    printCart.document.write('<hr/>')
    printCart.document.write('</br>');
    printCart.document.write('<center>');
    printCart.document.write('<table border="1" id="myDemo">   <thead><tr><th>#</th><th>Question_ID</th> <th>Metric_ID</th><th>Participant_ID</th><th>Option</th> <th>Ratings</th> <th>Status</th> <th>Metric</th>  <th>Participant</th>  <th>Location</th><th>Gender</th><th>Question</th> </tr></thead>');
        
    printCart.document.write(data);
    
    
    printCart.document.write('</table> ');
    printCart.document.write('</hr> ');
    printCart.document.write('</hr> ');
    printCart.document.write('</center>');
    printCart.document.write('</body></html>');

    printCart.print();
    printCart.close();

    return true;
}
    
