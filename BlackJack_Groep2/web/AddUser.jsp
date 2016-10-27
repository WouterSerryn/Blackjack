<%-- 
    Document   : addUser
    Created on : 26-okt-2016, 11:24:02
    Author     : Chayenne Jacques
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AddUserServlet" method="post">
            Naam: <input type="text" name="nickname" /><br>
            Credits: <input type="number" value="50" name="credits" /><br>
            <br>
            <button name="Terug">Terug</button><input type="submit" value="Bevestigen" />
        </form>
    </body>
</html>
