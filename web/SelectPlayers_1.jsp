<%-- 
    Document   : SelectPlayers
    Created on : 24-okt-2016, 16:17:32
    Author     : Wouter
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="blackjack.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    String a;
 
    ArrayList<String> selectie =new ArrayList();
    if(request.getParameter("select0")!=null)
    {
        selectie.add(request.getParameter("select0"));
    }
    else
    {
        selectie.add("");
    }
    if(request.getParameter("select1")!=null)
    {
        selectie.add(request.getParameter("select1"));
    }
    else
    {
        selectie.add("");
    }
    if(request.getParameter("select2")!=null)
    {
        selectie.add(request.getParameter("select2"));
    }
    else
    {
        selectie.add("");
    }
    if(request.getParameter("select3")!=null)
    {
        selectie.add(request.getParameter("select3"));
    }
    else
    {
        selectie.add("");
    }
    
    ArrayList<String> players = new ArrayList();
    ArrayList<String> users=new ArrayList();
    users.add("speler1");
    users.add("speler2");
    users.add("speler3");
    users.add("speler4");
    for(String s: users)
    {
        players.add("");
    }
    players.set(0,request.getParameter("select0"));
    players.set(1,request.getParameter("select1"));
    players.set(2,request.getParameter("select2"));
    players.set(3,request.getParameter("select3"));
    for(String s: players)
    {
        if(s.equals(null))
        {
            s="";
        }
    }
    if (request.getParameter("amount") == null) {
        a = "1";
    } else {
        a = request.getParameter("amount");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" name="PlayerSelect">
            <select onchange="Javascript:PlayerSelect.submit()" name="amount">
                <option <% if (a.equals("1")) {
                        out.print("Selected");
                    } %> value="1">1</option>
                <option <% if (a.equals("2")) {
                        out.print("Selected");
                    } %> value="2">2</option>
                <option <% if (a.equals("3")) {
                        out.print("Selected");
                    } %> value="3">3</option>
                <option <% if (a.equals("4")) {
                        out.print("Selected");
                    } %> value="4">4</option>
            </select>
            
                    <%
                        for(int i=0;i<Integer.parseInt(a);i++)
                        {
                            %>
                            <select onchange="Javascript:PlayerSelect.submit()" name="<% out.print("select"+i); %>">
                            <%
                        for(String s:users)
                        {
                            if(!(players.contains(s) && !players.get(i).equals(s)))
                            {
                            %>
                            <option <%
                                if(selectie.get(i).equals(s))
                                {
                                    out.print("selected");
                                    players.set(i, s);
                                }
                                %>
                                value="<% out.print(s); %>"><% out.print(s); %></option>
                            <%
                             
                           }
                        }
                       %>
                            </select>
<%
    }
    %>
    <input type="reset" value="reset" />
        </form>
    </body>
</html>
