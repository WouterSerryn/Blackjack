/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blackjack.services;

import blackjack.dao.HeaduserDAO;
import blackjack.model.Headuser;
import blackjack.util.Conversion;

/**
 *
 * @author Wouter
 */
public class HeaduserService {
    public static Headuser getHeaduser()
    {
       return Conversion.convertResultSetToHeaduser(HeaduserDAO.getHeadUser());
    }
    
    public static void editPassword(String password){
        HeaduserDAO.editHeaduserPassword(password);
    }
    public static boolean isAuthenticatedHeaduser(String email, String password)
    {
        boolean authenticated=false;
        int i=Conversion.convertResultSetToInt(HeaduserDAO.authenticateHeaduser(email, password));
        if(i>0)
        {
            authenticated=true;
        }
        return authenticated;
    }
}
