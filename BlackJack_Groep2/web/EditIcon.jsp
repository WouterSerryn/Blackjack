<%-- 
    Document   : editIcon
    Created on : 26-okt-2016, 12:56:23
    Author     : Chayenne Jacques
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="blackjack.model.Icon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Icon>iconList=(List<Icon>)request.getServletContext().getAttribute("iconList"); 
    String current=request.getParameter("iconName");
    String nickName=request.getParameter("nickName");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="post">
            Naam: <input type="text" readonly value="<% out.println(nickName); %>" name="nickname" /><br>
            Icoon: 
            <select name="icon">
                <%
                    Iterator<Icon> it=iconList.iterator();
                    Icon icon;
                    while(it.hasNext())
                    {
                        icon=it.next();
                        %>
                        <option value="<% out.println(icon.getIconName()); %>"></option>
                        <%
                    }
                    
                    %>
            </select>
            <img src="images/belle.jpg" />
            <br>
            <button name="Terug">Terug</button><input type="submit" value="Bevestigen">
        </form>
    </body>
</html>
