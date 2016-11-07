<%-- 
    Document   : StartScreen
    Created on : 24-okt-2016, 12:01:10
    Author     : Wouter
--%>
<% String loggedin = (String)request.getSession().getAttribute("loggedin"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="game.css" type="text/css" rel="stylesheet" />
        <title>Start</title>
    </head>
    <body>
        <div id="largeContainer">
            <div id="startTitle">Blackjack</div>
            <div id="startImage"></div>
            <a id="infoButton" class="regularButton" title="info" href="Info.jsp" >?</a>
             <% if (loggedin!="loggedin"){
               %><a id="loginButton" class="regularButton" title="Inloggen" href="LoginScreen.jsp" >Inloggen</a><%
             } 
        else
{
%>
<div id="userMenu"><img src="images/gear.png" class="menuImage" />
            <ul id="menuList">
                    <li class="regularButton"><a href="History.jsp">Historiek</a></li>
                <li class="regularButton"><a href="AccountManagement.jsp">Accounts</a></li>
                <li class="regularButton"><a href="EditPassword.jsp">Wijzigen</a></li>
                <li class="regularButton"><a href="LogOutServlet">Uitloggen</a></li>
            </ul>
</div>
              <% } %>  
                
                
            
            <a id="playButton" class="regularButton" title="Kies spelers" href="SelectPlayersServlet" >Kies spelers</a>  
            
            
        </div>
    </body>
</html>
