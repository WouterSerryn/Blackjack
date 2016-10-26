
package blackjack.model;

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

    public User(String nickname, int balance, Icon icon)  {
        this.nickname = nickname;
        this.balance = balance;
        this.icon = icon;
        this.hand = new Hand();
    }
    
    public void setIcon(Icon i){
        this.icon=i;
    }
    
    public void setGamestate(Gamestate gs){
        this.state=gs;
    }
    
    public Gamestate getState(){
        return this.state;
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

    public int getBet() {
        return bet;
    }

    public String getNickname() {
        return nickname;
    }

    public Icon getIcon() {
        return icon;
    }
    
    
    
}
