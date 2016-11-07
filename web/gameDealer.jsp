<%-- 
    Document   : gameDealer
    Created on : 3-nov-2016, 10:59:27
    Author     : Wouter
--%>

<%@page import="blackjack.model.Handstate"%>
<%@page import="java.util.Iterator"%>
<%@page import="blackjack.model.Game"%>
<%@page import="java.util.ArrayList"%>
<%@page import="blackjack.model.User"%>
<%
    
    Game game=(Game)request.getServletContext().getAttribute("game");
    ArrayList<User> players=game.getPlayers();
 
    
    
    %>
    
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="game.css" type="text/css" rel="stylesheet" />
        
        <title>JSP Page</title>
        <script type="text/javascript">
            function swapTable()
            {
                  
                   
                if (document.getElementById("winnings").classList.contains("visible"))
                {
                         document.getElementById("winnings").classList.remove("visible");
                        document.getElementById("winnings").classList.add("hidden");
                }
                else
                {
                   document.getElementById("winnings").classList.add("visible");
                        document.getElementById("winnings").classList.remove("hidden");  
                }
            }
        </script>
    </head>
    <body>
       
        <div id="largeGameContainer">
        <div id="gameContainer">
            <div id="dealer">
                <div class="amountAndState"><% if(game.getDealer().getHand().getState()==Handstate.Blackjack)
                           {
                               out.print("Black<br/>jack");
                           }
                           else if(game.getDealer().getHand().getState()==Handstate.Busted)
                           {
                               out.print("Busted");
                           }
                           else
                            {
                               out.print(game.getDealer().getHand().getValue());
                            }%></div>
                <img id="dealerIcon" src="images/jafar.png" />
                <div class="cardsBlock"><% for(int j=0;j<game.getDealer().getHand().getCards().size();j++){
                    %><div class="card"><img src="<%  
                        out.print(game.getDealer().getHand().getCards().get(j).getVisibleImage());     
                    %>" class="cardImage" /></div><%
                       } %></div>
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
                       
                           <div class="amountAndState"><% if(user.getHand().getState()==Handstate.Blackjack)
                           {
                               out.print("Black<br/>jack");
                           }
                           else if(user.getHand().getState()==Handstate.Busted)
                           {
                               out.print("Busted");
                           }
                           else
                            {
                               out.print(user.getHand().getValue());
                            }%></div>
                      
                           <div id="<%out.print("bet"+i);%>" class="playerBet">ingezet: <% out.print(user.getBet()); %> </div>
                       <div class="cardsBlock"><% for(int j=0;j<user.getHand().getCards().size();j++){
                           %><div class="card"><img src="<% out.print(user.getHand().getCards().get(j).getCardimage()); %>" class="cardImage" /></div><%
                       } %></div>
                   </div>
                   
                   <%
               }
                %>
            
                   
           <div id="betBlock">
               <div id="betName" class="userName">Geschiedenis</div>
                <div class="userChips"><button class="regularButton" id="swapTable" onclick="swapTable()"  name="hit">Tabel</button></div>
                
            </div>
                <div id="winnings" class="visible">
                    <table id="winningsTable">
                        <tr>
                        <th>naam</th><th>status</th>
                        </tr>
                    <%
                        it=players.iterator();
                        while(it.hasNext())
                        {
                            User player=it.next();
                            %>
                            <tr>
                                <td><% out.print(player.getNickname()); %></td>
                                <td><% out.print(player.getState()); %></td>      
                            </tr>
                            <%
                        }
                        %>
                    </table>
                    <button id="toStart" onclick="window.location='StartScreen.jsp'" class="regularButton">naar startmenu</button>
                    <button id="restart" onclick="window.location='RestartServlet'" class="regularButton">verderspelen</button>
                </div>
                
                
        </div>
        </div>
    </body>
</html>