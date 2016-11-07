<%-- 
    Document   : History
    Created on : 2-nov-2016, 20:31:19
    Author     : Chayenne Jacques
--%>

<%@page import="java.util.Iterator"%>
<%@page import="blackjack.services.HistoryService"%>
<%@page import="blackjack.model.History"%>
<%@page import="java.util.List"%>

<% String loggedin = (String)request.getSession().getAttribute("loggedin");
            if (loggedin!="loggedin"){
                RequestDispatcher view = request.getRequestDispatcher("LoginScreen.jsp?page=History.jsp");
        view.forward(request, response);
             } 
        else
{

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% List<History> history = HistoryService.getAllHistory();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="game.css" />
        <title>Geschiedenis</title>
    </head>
    <body> 
        <div class="tableWrapper">
        <table class="table">
            <thead>
            <tr>
                <th>Datum</th>
                <th>GameId</th>
                <th>Speler</th> 
                <th>Balans</th>
                <th>Inzet</th>
                <th>Status</th>
            </tr>
            </thead>
            <tbody>
                
            <% Iterator<History> it = history.iterator();
            int previousGameId=-1;
            String previousDate="-1";
                while (it.hasNext()) {
                     History h = it.next(); %>
            <tr>
                <td><% 
                    if(!(h.getDate().equals(previousDate)))
                    {
                    out.print(h.getDate());
                    }
                %></td>
                <td><%
                    if(h.getGameId()!=previousGameId)
                    {
                    out.print(h.getGameId()); 
                    }
                %></td>
                <td><% out.print(h.getUser().getNickname()); %></td> 
                <td><% out.print(h.getUser().getBalance()); %><img class="coin" src="images/coin.png" alt="coin" /></td>
                <td><% out.print(h.getUser().getBet()); %><img class="coin" src="images/coin.png" alt="coin" /></td>
                <td><% out.print(h.getGamestate()); %></td>
            </tr> 
            <%
            previousGameId=h.getGameId();
            previousDate=h.getDate();
            }%>
            </tbody>
        </table>
        </div>
        <br>
        <form>
            <button name="Terug" class="regularButton" id="previous" formaction="StartScreen.jsp">Terug</button>
        </form>
    </body>
</html>
<% }
%>
