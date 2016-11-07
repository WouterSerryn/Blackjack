<%-- 
    Document   : EditUser
    Created on : 26-okt-2016, 10:57:39
    Author     : Chayenne Jacques
--%>

<%@page import="blackjack.services.IconService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="blackjack.model.Icon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <% String loggedin = (String)request.getSession().getAttribute("loggedin");
            if (loggedin!="loggedin"){
                RequestDispatcher view = request.getRequestDispatcher("LoginScreen.jsp?page=AccountManagement.jsp");
        view.forward(request, response);
             } 
        else
{

%>
<% String nickname = request.getParameter("nickname");
    String iconname = request.getParameter("iconname");
    int balance = Integer.parseInt(request.getParameter("balance"));
        if(request.getServletContext().getAttribute("iconList")==null)
    {
        List<Icon> iconList=IconService.getIcons();
        request.getServletContext().setAttribute("iconList",iconList);
    }
    List<Icon> iconList = (List<Icon>)request.getServletContext().getAttribute("iconList"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ModifyUserServlet" method="post">
            Naam: <input type="text" readonly value="<% out.print(nickname); %>" name="nickname" /><br>
            Credits: <input type="number" min="0" autofocus placeholder="<% out.print(balance); %>" name="balance" /><br>
            <input type="hidden" name="iconname" value="<% out.print(iconname); %>" />

            <br>
            <button name="Terug" onclick="window.location='AccountManagement.jsp'">Terug</button><input type="submit" value="Bevestigen" />
        </form>
    </body>
</html>
<% } %>
