/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blackjack.model;

import blackjack.services.UserService;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Wouter
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        List<User> users = UserService.getUsers();
        Iterator<User> it = users.iterator();
        while (it.hasNext()) {
            System.out.println(it.next().getNickname());
        }
        
        
        
        
    }

}
