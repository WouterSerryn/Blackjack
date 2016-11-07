<%-- 
    Document   : Game
    Created on : 24-okt-2016, 8:07:57
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
    String currentPlayerIndex=(String)request.getServletContext().getAttribute("currentPlayerIndex");
    System.out.println("current player index: "+currentPlayerIndex);
    request.getServletContext().setAttribute("currentPlayerIndex",currentPlayerIndex);
    
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
                <div class="amountAndState">
                    <% out.print(game.getDealer().getHand().getCards().get(0).getValue()); %>
                </div>
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
                       <div class="userName"><%out.print(user.getBalance()); %><img class="coin" src="images/coin.png" alt="coin" />
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
                      
                           <div id="<%out.print("bet"+i);%>" class="playerBet">ingezet: <% out.print(user.getBet()); %><img class="coin" src="images/coin.png" alt="coin" /> </div>
                       <div class="cardsBlock"><% for(int j=0;j<user.getHand().getCards().size();j++){
                           %><div class="card"><img src="<% out.print(user.getHand().getCards().get(j).getCardimage()); %>" class="cardImage" /></div><%
                       } %></div>
                   </div>
                   
                   <%
               }
                %>
            
                   
           <div id="betBlock">
               <div id="betName" class="userName"><% out.println(game.getPlayers().get(Integer.parseInt(currentPlayerIndex)).getNickname()); %></div>
                <div class="userChips"><button onclick="window.location='GameServlet?action=hit'" class="regularButton"  name="hit">Hit</button>
                <button onclick="window.location='GameServlet?action=stand'" class="regularButton"  name="stand">Stand</button></div>
                
            </div>
                
                
        </div>
        </div>
    </body>
</html>

