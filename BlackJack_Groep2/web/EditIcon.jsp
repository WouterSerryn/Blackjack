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
    </head>
    <body>
        <div id="container">
            
            <div class="playerBlock">
                <div class="editPlayerName">
                    <% out.print(nickname); %>
            </div>
        <form name="iconForm" action="ModifyIconServlet" method="post">
            <input class="regularButton" type="hidden" value="<% out.print(nickname); %>" name="nickname" /><br>
            <select class="regularButton" name="iconname" onchange="Javascript:iconForm.submit()">
                <%
                    Iterator<Icon> it = iconList.iterator();
                    Icon iconFromList;
                    while (it.hasNext()) {
                        iconFromList = it.next();
                %>
                <option <%
                    if (iconFromList.getIconName().equals(icon.getIconName())) {
                        out.println("selected");
                    }
                    %> value="<% out.print(iconFromList.getIconName()); %>"><% out.print(iconFromList.getIconName()); %></option>
                <%
                    }

                %>
            </select>
            <img class="userIcon" src="<% out.print(icon.getIconImage());%>" />
            <br>
            <button class="regularButton" name="Terug" formaction="SelectPlayers.jsp">Terug</button>
        </form>
            </div>
        </div>
    </body>
</html>
