<%-- 
    Document   : editIcon
    Created on : 26-okt-2016, 12:56:23
    Author     : Chayenne Jacques
--%>

<%@page import="blackjack.services.IconService"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="blackjack.model.Icon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Icon> iconList = (List<Icon>) request.getServletContext().getAttribute("iconList");
    Icon icon = (Icon) request.getAttribute("icon");
    String nickname = (String) request.getAttribute("nickname");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="game.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
        <script type="text/javascript">
            oldIndex=0;
           
            function swapSelected(index,newname)
            {
                    form=document.getElementById("iconForm");
                   
                if (document.getElementById(index).classList.contains("userBlock"))
                {
                    
                    console.log(window.oldIndex+" "+index);
                         document.getElementById(index).classList.remove("userBlock");
                        document.getElementById(index).classList.add("userBlockSelected");
                     if(window.oldIndex !==0)
                        {   
                       document.getElementById(window.oldIndex).classList.add("userBlock");
                    document.getElementById(window.oldIndex).classList.remove("userBlockSelected");
                        
                       
                       
                   }
                   window.oldIndex=index;
                       console.log(newname);
                       document.getElementById("iconName").value=newname;
                }
                   
            }
            </script>
    </head>
    <body>
        <div id="largeContainer">
            
            
        <form name="iconForm" id="iconForm" action="ModifyIconServlet" method="post">
            <div id="userBlockContainer">
            <input name="nickname" class="regularButton" type="hidden" value="<% out.print(nickname); %>" /><br/>
            <input name="newIconName" id="iconName" class="regularButton" type="hidden" value="<% out.print(icon.getIconName()); %>" />
            
                <%
                    Iterator<Icon> it = iconList.iterator();
                    Icon iconFromList;
                    int i=1;
                    while (it.hasNext()) {
                        iconFromList = it.next();
                
                %>
                
                <div id="<%out.print(i);%>" class="userBlock" onclick="swapSelected(<%out.print(i);%>,<% out.print("\'"+iconFromList.getIconName()+"\'"); %>)">
                  <div class="userName">
                      <% out.print(iconFromList.getIconName()); %>
                  </div>
                  <div class="icon">
                      <img class="userIcon" src="<% out.print(iconFromList.getIconImage()); %>" />
                  </div>
               
                </div>
        
                
            
         <% i++; } %>
      
             </div>
        </form>
            </div>
       <button class="regularButton" name="Terug" id="previous" onclick="window.location='SelectPlayersServlet'">Terug</button>
            <input type="submit" onclick="javascript:iconForm.submit()" class="regularButton" id="next" name="submit" value="Bevestigen" />
    </body>
</html>