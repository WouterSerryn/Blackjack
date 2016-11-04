<%-- 
    Document   : StartScreen
    Created on : 24-okt-2016, 12:01:10
    Author     : Wouter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="game.css" type="text/css" rel="stylesheet" />
        <title>Start</title>
    </head>
    <body>
        <div id="container">
            <div id="startTitle">Blackjack</div>
            <div id="startImage"></div>
            <a id="infoButton" class="regularButton" title="info" href="" >?</a>
            <a id="loginButton" class="regularButton" title="Inloggen" href="LoginScreen.jsp" >Inloggen</a>
            <a id="playButton" class="regularButton" title="Kies spelers" href="SelectPlayersServlet" >Kies spelers</a>  
            
            <div id="userMenu"><img src="images/gear.png" class="menuImage" />
                <ul id="menuList">
                    <li class="regularButton"><a href="History.jsp">historiek</a></li>
                <li class="regularButton"><a href="AccountManagement.jsp">accounts</a></li>
                <li class="regularButton"><a href="EditPassword.jsp">wijzigen</a></li>
                <li class="regularButton"><a href="LogOutServlet">uitloggen</a></li>
            </ul>
            </div>
        </div>
    </body>
</html>