<%-- 
    Document   : EditUser
    Created on : 26-okt-2016, 10:57:39
    Author     : Chayenne Jacques
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="blackjack.model.Icon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String nickname = request.getParameter("nickname");
    String iconname = request.getParameter("iconname");
    int balance = Integer.parseInt(request.getParameter("balance"));
    List<Icon> iconList = (List<Icon>) request.getServletContext().getAttribute("iconList"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="post">
            Naam: <input type="text" readonly value="<%out.println(nickname);%>" name="nickname" /><br>
            Credits: <input type="text" value="<%out.println(balance);%>" name="credits" /><br>
            Icoon: 
            <select name="icon">
                <%
                    Iterator<Icon> it = iconList.iterator();
                    Icon icon;
                    while (it.hasNext()) {
                        icon = it.next();
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
