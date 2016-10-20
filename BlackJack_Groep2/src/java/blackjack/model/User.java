
package blackjack.model;

/**
 *
 * @author Chayenne Jacques
 */
public class User {
    
    private String nickname;
    private int balance;
    private Icon icon;
    private Hand hand;
    private Gamestate state;

    public User(String nickname, int balance, Icon icon) {
        this.nickname = nickname;
        this.balance = balance;
        this.icon = icon;
    }
    
    
    
    
}
