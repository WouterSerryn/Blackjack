
package blackjack.model;

/**
 *
 * @author Chayenne Jacques
 */
public class Card {
    
    private Suit suit;
    private Rank rank;
    private boolean visible;
    private String cardimage;
    private String backimage;

    public Card(Suit suit, Rank rank) {
        this.suit = suit;
        this.rank = rank;
        this.cardimage="images/cards/"+this.rank.name().toLowerCase()+"_of_"+this.suit.name().toLowerCase()+".png";
        
        this.backimage="images/cards/backimage.png";
        
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
    public void setRankToSmallAce()
    {
        this.rank=Rank.SmallAce;
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

    public boolean isVisible() {
        return visible;
    }

    public String getCardimage() {
        return cardimage;
    }

    public String getBackimage() {
        return backimage;
    }
    
    
    
}
