
package blackjack.model;

import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Chayenne Jacques
 */
public class Hand {
    
    private ArrayList<Card> kaarten;
    private int bet;
    private Handstate state;

    public Hand() {
        this.kaarten = new ArrayList();
    }
    
    /**
     * hoeveel credits een speler wil inzetten
     * @param amount 
     */
    public void setBet(int amount){
        this.bet=amount;
    }
    /**
     * Card c toevoegen aan de Hand na de kaartverdeling of Hit
     * @param c 
     */
    public void addCard(Card c){
        kaarten.add(c);
    }
    
    public void evaluate(){
        
    }
    
    public void setStatus(Handstate hs){
        this.state = hs;
    }
    
    public int getValue(){
        int value = 0;
        Iterator <Card> it = kaarten.iterator();
        while (it.hasNext()){
            value+= it.next().getValue();
        }
        return value;
    }
    
    
    
}
