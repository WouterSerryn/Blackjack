<%-- 
    Document   : AccountManagement
    Created on : 26-okt-2016, 12:51:48
    Author     : Chayenne Jacques
--%>

<%@page import="java.util.Iterator"%>
<%@page import="blackjack.services.UserService"%>
<%@page import="java.util.List"%>
<%@page import="blackjack.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% List<User> users = UserService.getUsers(); %>       
        <table>
            <tr>
                <th>Icoon</th>
                <th>Naam</th> 
                <th>Credits</th>
                <th>Bewerkingen</th>
            </tr>
            <% Iterator <User> it = users.iterator();
                while (it.hasNext()) {
                    User user = it.next(); %>
            <tr>
                <td><% out.print(user.getIcon().getIconName()); %></td>
                <td><% out.print(user.getNickname()); %></td> 
                <td><% out.print(user.getBalance()); %></td>
                <td><a href="EditUser.jsp?nickname=<% out.print(user.getNickname()); %>&iconname=<% out.print(user.getIcon().getIconName()); %>&balance=<% out.print(user.getBalance()); %>">Wijzig</a> <a href="DeleteUserServlet?nickname=<% out.print(user.getNickname()); %>">Verwijder</a></td>
            </tr> <% } %>
        </table>
        <br>
        <button name="Terug" formaction="StartScreen.jsp">Terug</button><button name="gebruikerToevoegen" formaction="AddUser.jsp">Gebruiker toevoegen</button>
    </body>
</html>
