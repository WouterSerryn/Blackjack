
package blackjack.model;

import java.net.URI;

/**
 *
 * @author Chayenne Jacques
 */
public class Card {
    
    private Suit suit;
    private Rank rank;
    private boolean visible;
    private URI cardimage;
    private URI backimage;

    public Card(Suit suit, Rank rank) {
        this.suit = suit;
        this.rank = rank;
        visible = true;
    }
    
    /**
     * vraagt de naam van kaart op
     * @return 
     */
    public String getRankname(){
        return this.rank.name();
    }
    
    /**
     * vraagt de waarde van de kaart op
     * @return 
     */
    public int getValue(){
        return this.rank.getValue();
    }
    
    /**
     * vraagt de suit op (harten, ruiten, schoppen, klaveren)
     * @return 
     */
    public String getSuitname(){
        return this.suit.name();
    }
    
    public void setVisibility(boolean visibility){
        visible=visibility;
    }
    
}
