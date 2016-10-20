
package blackjack.model;

/**
 *
 * @author Chayenne Jacques
 */
public class Headuser extends User {
    
    private String password;
    private String email;
    
    public Headuser(String nickname, int balance, Icon icon, String password, String email) {
        super(nickname, balance, icon);
        this.password=password;
        this.email=email;
    }
    
    
    
}
