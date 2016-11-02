<%-- 
    Document   : History
    Created on : 2-nov-2016, 20:31:19
    Author     : Chayenne Jacques
--%>

<%@page import="java.util.Iterator"%>
<%@page import="blackjack.services.HistoryService"%>
<%@page import="blackjack.model.History"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% List<History> history = HistoryService.getAllHistory();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Geschiedenis</title>
    </head>
    <body> 
        <table>
            <tr>
                <th>Datum</th>
                <th>Speler</th> 
                <th>Inzet</th>
                <th>Status</th>
            </tr>
            <% Iterator<History> it = history.iterator();
                while (it.hasNext()) {
                     History h = it.next(); %>
            <tr>
                <td><% out.print(h.getDate()); %></td>
                <td><% out.print(h.getUser().getNickname()); %></td> 
                <td><% out.print(h.getUser().getBet()); %></td>
                <td><% out.print(h.getUser().getState()); %></td>
            </tr> 
            <% }%>
        </table>
        <br>
        <form>
            <button name="Terug" formaction="StartScreen.jsp">Terug</button>
        </form>
    </body>
</html>
