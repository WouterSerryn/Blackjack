<%-- 
    Document   : editIcon
    Created on : 26-okt-2016, 12:56:23
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
        <form action="" method="post">
            Naam: <input type="text" readonly value="naam" name="nickname" /><br>
            Icoon: 
            <select name="icon">
                <option value="1">Belle</option>
            <option value="2">Rapunzel</option>
            </select>
            <img src="images/belle.jpg" />
            <br>
            <button name="Terug">Terug</button><input type="submit" value="Bevestigen">
        </form>
    </body>
</html>
