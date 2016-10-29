<%-- 
    Document   : SelectPlayers
    Created on : 24-okt-2016, 16:17:32
    Author     : Wouter
--%>

<%@page import="java.util.List"%>
<%@page import="blackjack.services.UserService"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="blackjack.model.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //int max=4;
    List<User> users = (List<User>)request.getAttribute("users");
    


%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="game.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript">
            selected = 0;
            users = [];
            function swapSelected(index, user)
            {
                     document.getElementById("playerList").innerHTML="Volgorde: ";
                   
                if (document.getElementById(index).classList.contains("userBlock"))
                {
                    
                    if (selected < 4)
                    {
                        
                        users.push(user);
                        document.getElementById(index).classList.remove("userBlock");
                        document.getElementById(index).classList.add("userBlockSelected");
                        window.selected = window.selected + 1;
                    }
                    else
                    {
                        alert("Maximum 4 spelers");
                    }
                } else
                {
                    for (var i = users.length - 1; i >= 0; i--) {
                        if (users[i] === user) {
                            users.splice(i, 1);
                        }
                    }
                    document.getElementById(index).classList.add("userBlock");
                    document.getElementById(index).classList.remove("userBlockSelected");
                    window.selected--;

                }
                   
                for (var i = 0; i < users.length; i++) {
                    console.log(users[i]);
                    if(i>0)
                    {
                      var  splitter=" |";
                    }
                    else
                    {
                        var splitter="";
                    }
                    document.getElementById("playerList").innerHTML +=splitter+" "+users[i];
                }
            }
            function submitForm()
            {

                var form = document.getElementById("userSelect");

                
                for (var i = 0; i < users.length; i++) {


                    element = document.createElement("input");
                    element.setAttribute("name", i);
                    element.setAttribute("type", "hidden");
                    element.setAttribute("value", users[i]);
                    form.appendChild(element);
                    console.log("added");
                }
               
                if(users.length>0)
                {
                form.submit();
            }
            else{
                alert("gelieve minstens 1 speler selecteren");
            }





            }
        </script>
        <title>Spelers selecteren</title>
    </head>
    <body>
        <form id="userSelect" name="userSelect" action="GamePlayerListServlet" method="post">
            <div id="largeContainer">
                <div id="userBlockContainer">
                    <%  Iterator<User> it = users.iterator();
                        User user;
                        int i = 0;
                        while (it.hasNext()) {
                            user = it.next();
                    %>
                    <div class="userBlockWrapper">
                        <div onclick="swapSelected(<% out.print(i + "," + "'" + user.getNickname() + "'"); %>)" class="userBlock" id="<% out.print(i); %>">
                            <div class="userName"><% out.println(user.getNickname()); %></div><div class="userChips"><% out.println(user.getBalance()+"<br/>chips"); %></div><img class="userIcon" src="<% out.println(user.getIcon().getIconImage()); %>" />
                        </div>
                            <a href="ModifyIconServlet?nickName=<% out.println(user.getNickname()); %>&iconName=<% out.println(user.getIcon().getIconName()); %>" title="Icoon wijzigen" class="editIcon"><img class="editIconImage" src="images/gear.png" /></a>
                    </div>
                    <%

                            i++;
                        }
                    %>
                </div>

            </div>
            <br/>


        </form>
                <div id="playerListWithButtons">
                <div id="playerList">Volgorde: </div>
                <button class="regularButton" id="previous" onclick="location.href='StartScreen.jsp'">vorige</button>
        <button class="regularButton" id="next" onclick="submitForm()" name="ok">volgende</button>
                </div>
    </body>
</html>
