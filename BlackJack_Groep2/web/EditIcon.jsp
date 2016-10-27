<%-- 
    Document   : editIcon
    Created on : 26-okt-2016, 12:56:23
    Author     : Chayenne Jacques
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="blackjack.model.Icon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Icon>iconList=(List<Icon>)request.getServletContext().getAttribute("iconList"); 
    Icon icon=(Icon)request.getServletContext().getAttribute("icon");
    String nickName=(String)request.getServletContext().getAttribute("nickName");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="iconForm" action="ModifyIconServlet" method="post">
            Naam: <input type="text" readonly value="<% out.println(nickName); %>" name="nickname" /><br>
            Icoon: 
            <select name="iconName" onchange="Javascript:iconForm.submit()">
                <%
                    Iterator<Icon> it=iconList.iterator();
                    Icon itIcon;
                    while(it.hasNext())
                    {
                        itIcon=it.next();
                        %>
                        <option <%
                            if(itIcon.getIconName().equals(icon.getIconName()))
                            {
                                out.println("selected");
                            }
                            %> value="<% out.println(itIcon.getIconName()); %>"><% out.println(itIcon.getIconName()); %></option>
                        <%
                    }
                    
                    %>
            </select>
                    <img src="<% out.println(icon.getIconImage()); %>" />
            <br>
            <button name="Terug">Terug</button><input type="submit" value="Bevestigen">
        </form>
    </body>
</html>
