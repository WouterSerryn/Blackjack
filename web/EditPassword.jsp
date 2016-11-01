<%-- 
    Document   : EditPassword
    Created on : 31-okt-2016, 12:38:13
    Author     : Chayenne Jacques
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wachtwoord wijzigen</title>
    </head>
    <body>
        <form action="EditPasswordServlet" method="post">
            <label><b>Oud wachtwoord</b></label>
            <input type="text" placeholder="Vul uw oud wachtwoord in" name="oldPassword" required>
            <br>
            <label><b>Nieuw wachtwoord</b></label>
            <input type="password" placeholder="Vul uw nieuw wachtwoord in" name="newPassword" required>
            <br>
            <button name="Terug" formaction="StartScreen.jsp">Terug</button>
            <button name="login" type="submit">Wijzig wachtwoord</button>
        </form>
    </body>
</html>
