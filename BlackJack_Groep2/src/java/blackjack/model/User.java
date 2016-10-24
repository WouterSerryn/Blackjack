
package blackjack.model;

import java.net.URI;
import java.net.URISyntaxException;

/**
 *
 * @author Chayenne Jacques
 */
public class User {
    
    private String nickname;
    private int balance;
    private Icon icon;
    private int bet;
    private Hand hand;
    private Gamestate state;

    public User(String nickname, int balance) throws URISyntaxException {
        this.nickname = nickname;
        this.balance = balance;
        this.icon = new Icon("naam",new URI("path"));
        this.hand = new Hand();
    }
    
    public void setIcon(Icon i){
        this.icon=i;
    }
    
    public void setGamestate(Gamestate gs){
        this.state=gs;
    }
    
    /**
     * hoeveel credits een speler wil inzetten
     * @param amount 
     */
    public void setBet(int amount){
        this.bet=amount;
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
