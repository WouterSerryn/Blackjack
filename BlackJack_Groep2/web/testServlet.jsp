<%-- 
    Document   : testServlet
    Created on : 25-okt-2016, 18:54:17
    Author     : Wouter
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.EnumSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    List<String> parameterNames = new ArrayList(request.getParameterMap().keySet());
    ArrayList<String> players=new ArrayList();
    Iterator<String> it=parameterNames.iterator();
    while(it.hasNext())
    {
       players.add((String)request.getParameter(it.next())); 
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            Iterator<String> it2=players.iterator();
            while(it2.hasNext())
            {
                out.println(it2.next());
            }
            %>
       
    </body>
</html>
