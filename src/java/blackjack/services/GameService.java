/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blackjack.services;

import blackjack.dao.GameDAO;

/**
 *
 * @author Wouter
 */
public class GameService {
    public static void addGame(String date)
    {
        GameDAO.addGame(date);
    }
}
