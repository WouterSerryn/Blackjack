/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blackjack.web;

import blackjack.model.Game;
import blackjack.model.Handstate;
import blackjack.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Wouter
 */
public class GameServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("Game.jsp");
        Game game = (Game) request.getServletContext().getAttribute("game");
        String currentPlayerIndex = (String) request.getServletContext().getAttribute("currentPlayerIndex");
        System.out.println(currentPlayerIndex);
        int index = Integer.parseInt(currentPlayerIndex);
        if (currentPlayerIndex == null) {
            System.out.println("no currentplayer");
            request.getServletContext().setAttribute("currentPlayerIndex", "0");
             while(game.getPlayers().size()>index+1 && game.getPlayers().get(index).getHand().getState()==Handstate.Blackjack)
                    {
                    index += 1;
                    }
             request.getServletContext().setAttribute("currentPlayerIndex", index + "");
        }else if (Integer.parseInt(currentPlayerIndex) < game.getPlayers().size()) {
            
            String action = (String) request.getParameter("action");
            User currentPlayer = game.getPlayers().get(index);
            if (action.equals("hit")) {
                game.playerHit(currentPlayer);
                currentPlayer.getHand().evaluate();
                if (currentPlayer.getHand().getState() == Handstate.Busted || currentPlayer.getHand().getState()==Handstate.Stand) {
                    index+=1;
                    while(game.getPlayers().size()>index+1 && game.getPlayers().get(index).getHand().getState()==Handstate.Blackjack)
                    {
                    index += 1;
                    }
                }
            } else {
                index += 1;
                currentPlayer.getHand().setState(Handstate.Stand);
            }
            
            request.getServletContext().setAttribute("currentPlayerIndex", index + "");
            if(index>=game.getPlayers().size())
            {
                request.getServletContext().setAttribute("currentPlayerIndex", null);
                game.getDealer().getHand().getCards().get(1).setVisibility(true);
                        view = request.getRequestDispatcher("gameDealerServlet");
            }
        } 
            
        
        request.getServletContext().setAttribute("game", game);

        view.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
