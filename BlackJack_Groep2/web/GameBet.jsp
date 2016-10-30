<%-- 
    Document   : GameBet
    Created on : 27-okt-2016, 15:23:16
    Author     : Wouter
--%>
<%@page import="java.util.Iterator"%>
<%@page import="blackjack.model.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="blackjack.model.User"%>
<%
    ArrayList<String> nickNames=(ArrayList<String>)request.getServletContext().getAttribute("nickNames");
    Game game=(Game)request.getServletContext().getAttribute("game");
    ArrayList<User> players=game.getPlayers();
    
    %>
    
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="game.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript">
        var playerNames = [<% for (int i = 0; i < nickNames.size(); i++) { %>"<%= nickNames.get(i) %>"<%= i + 1 < nickNames.size() ? ",":"" %><% } %>];
        console.log(playerNames);
        var index=0;
         
        function setBet()
        { 
            bet=document.getElementById("betInput").value;
            if(bet>document.getElementById("betInput").max)
            {
                alert("U hebt niet zoveel credits!");
            }
            else
            {
            var form=document.getElementById("formBet");
        console.log(window.index);
            
            console.log(bet);
           if(window.index<window.playerNames.length)
           {
                 element = document.createElement("input");
                    element.setAttribute("name", playerNames[index]);
                    element.setAttribute("type", "hidden");
                    element.setAttribute("value", bet);
                   form.appendChild(element);
                   window.index++;
                   console.log("bet"+(index));
               document.getElementById("bet"+(index)).innerHTML="inzet: "+bet;

            
             document.getElementById("betName").innerHTML="inzet "+playerNames[window.index];
           }
           if(window.index===window.playerNames.length)
           {
               document.getElementById("betName").innerHTML="Ga verder?";
               document.getElementById("betInput").classList.remove("visble");
               document.getElementById("betInput").classList.add("hidden");
               document.getElementById("betConfirm").innerHTML="Bevestigen";
               document.getElementById("betConfirm").style.cssText="right: 35px;";
            window.index++;
          
             
            
             
           }
           else if(window.index>playerNames.length)
           {
               form.submit();
           }
            }
           
        }
    </script>
        <title>JSP Page</title>
    </head>
    <body>
       
        <div id="largeGameContainer">
        <div id="gameContainer">
            <div id="dealer">
                <img id="dealerIcon" src="images/jafar.png" />
            </div>
            <%
               Iterator<User> it=players.iterator();
               User user=null;
               int i=0;
               while(it.hasNext())
               {
                   i++;
                   user=it.next();
                   %>
                   <div id="<%out.print("p"+i);%>" class="playerBlock">
                       <div class="userName"><%out.print(user.getBalance()+" coins"); %>
                           <img class="playerIcon" src="<%out.print(user.getIcon().getIconImage());%>" alt="icoon" />
                           
                        </div>   
                           <span class="playerName"><% out.print(user.getNickname()); %></span>
<!--                       <div class="userName"><% out.print(user.getNickname()); %></div>-->
                       
                       
                      
                       <div id="<%out.print("bet"+i);%>" class="playerBet">inzet: </div>
                   </div>
                   
                   <%
               }
                %>
            
                   
            <div id="betBlock">
                <div id="betName" class="userName">inzet <% out.println(nickNames.get(0)); %></div>
                <div class="userChips"><input class="visible regularButton" id="betInput" size="10" type="number" max="<%out.print(players.get(0).getBalance());%>" min="0" name="bet" value="1" /><button onclick="setBet()" class="regularButton" id="betConfirm" name="confirm">ok</button></div>
                
            </div>
                <form method="post" action="GameBetServlet" id="formBet">
                   </form>
        </div>
        </div>
    </body>
</html>
