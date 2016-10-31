
package blackjack.model;

import blackjack.dao.UserDAO;
import blackjack.services.UserService;


/**
 *
 * @author Chayenne Jacques
 */
public class Headuser extends User {
    
    private String password;
    private String email;
    
    public Headuser(String nickname, int balance, String password, String email, Icon icon) {
        super(nickname, balance, icon);
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
    
    public void editUser (User user){
        UserService.editUser(user);
    }
    
    public void addUser(User user){
        UserService.addUser(user);
    }
    
    public void removeUser(String nickname){
        UserService.removeUser(nickname);
    }
}
