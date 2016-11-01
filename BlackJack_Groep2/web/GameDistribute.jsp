<%-- 
    Document   : GameDistribute
    Created on : 28-okt-2016, 12:15:20
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
    </head>
    <body>
       
        <div id="largeGameContainer">
        <div id="gameContainer">
            <div id="dealer">
                <img id="dealerIcon" src="images/jafar.png" />
                <div class="cardsBlock"><% for(int j=0;j<game.getDealer().getHand().getCards().size();j++){
                    %><div class="card"><img src="<% 
                        if(game.getDealer().getHand().getCards().get(j).isVisible())
                        {
                        out.print(game.getDealer().getHand().getCards().get(j).getCardimage()); 
                        }
                        else
                        {
                         out.print(game.getDealer().getHand().getCards().get(j).getBackimage());    
                        }
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
            
                   
           
        </div>
        </div>
    </body>
</html>
