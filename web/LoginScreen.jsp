<%-- 
    Document   : LoginScreen
    Created on : 1-nov-2016, 18:28:38
    Author     : Chayenne Jacques
--%>

<%
String page1=request.getParameter("page");
if(page1==null)
{
    page1="StartScreen.jsp";
}

%>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form method="post" action="LogInServlet">
            <input type="hidden" name="page" value="<% out.print(page1); %>" />
            <label><b>E-mailadres</b></label>
            <input type="text" placeholder="Vul uw e-mailadres in" name="email" required />
            <br>
            <label><b>Wachtwoord</b></label>
            <input type="password" placeholder="Vul uw wachtwoord in" name="password" required />
            <br>
            <button name="Terug" onclick="window.location='StartScreen.jsp'">Terug</button>
            <button name="login" type="submit">Login</button>
        </form>
        
    </body>
</html>

