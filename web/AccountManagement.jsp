<%-- 
    Document   : AccountManagement
    Created on : 26-okt-2016, 12:51:48
    Author     : Chayenne Jacques
--%>
<% String loggedin = (String)request.getSession().getAttribute("loggedin");
            if (loggedin!="loggedin"){
                RequestDispatcher view = request.getRequestDispatcher("LoginScreen.jsp?page=AccountManagement.jsp");
        view.forward(request, response);
             } 
        else
{

%>
<%@page import="blackjack.model.Headuser"%>
<%@page import="blackjack.services.HeaduserService"%>
<%@page import="java.util.Iterator"%>
<%@page import="blackjack.services.UserService"%>
<%@page import="java.util.List"%>
<%@page import="blackjack.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<User> users = UserService.getUsers();
    System.out.println(users.get(0).getNickname());
    Headuser headuser = HeaduserService.getHeaduser();
    String headuserNickname = headuser.getNickname();

    System.out.println(headuser.getNickname());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="game.css" />
        <title>JSP Page</title>
    </head>
    <body> 
        <div class="tableWrapper">
        <table class="table2">
            <thead>
            <tr>
                <th>Icoon</th>
                <th>Naam</th> 
                <th><img class="coin" src="images/coin.png" alt="coin" /></th>
                <th>Bewerkingen</th>
            </tr>
            </thead>
            <tbody>
            <% Iterator<User> it = users.iterator();
                while (it.hasNext()) {
                    User user = it.next(); %>
            <tr>
                <td><% out.print(user.getIcon().getIconName()); %></td>
                <td><% out.print(user.getNickname()); %></td> 
                <td><% out.print(user.getBalance()); %></td>
                <td><a class="regularButton" href="EditUser.jsp?nickname=<% out.print(user.getNickname()); %>&iconname=<% out.print(user.getIcon().getIconName()); %>&balance=<% out.print(user.getBalance()); %>">Wijzig</a> 
                    <% if (!(headuserNickname.equals(user.getNickname()))) { %>  <a class="regularButton" href="DeleteUserServlet?nickname=<% out.print(user.getNickname()); %>">Verwijder</a><% } %></td>
            </tr> 
            
            <% }%>
            </tbody>
        </table>
        </div>
        <br>
        <form>
            <button class="regularButton" id="previous" name="Terug" formaction="StartScreen.jsp">Terug</button><button class="regularButton" id="next" name="gebruikerToevoegen" formaction="AddUser.jsp">Gebruiker toevoegen</button>
        </form>
        
    </body>
</html><%
}%>
