
package blackjack.model;

import java.net.URISyntaxException;

/**
 *
 * @author Chayenne Jacques
 */
public class Headuser extends User {
    
    private String password;
    private String email;
    
    public Headuser(String nickname, int balance, String password, String email) throws URISyntaxException {
        super(nickname, balance);
        this.password=password;
        this.email=email;
    }
    /**
     * amount is het aantal credits die je wil toekennen aan een bepaalde speler(user)
     * @param amount
     * @param user 
     */
    public void addCredits(int amount, User user){
        user.setBalance(user.getBalance()+amount);
    }
    
    
    
    
    
}
