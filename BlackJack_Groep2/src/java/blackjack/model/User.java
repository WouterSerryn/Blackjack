
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
    
    public void setIcon(Icon i){
        this.icon=i;
    }
    
    public void setGamestate(Gamestate gs){
        this.state=gs;
    }
    
    public Hand getHand(){
        return hand;
    }
    
    public int getBalance(){
        return balance;
    }
    
    public void setBalance(int balance){
        this.balance=balance;
    }
    
    
    
    
}
