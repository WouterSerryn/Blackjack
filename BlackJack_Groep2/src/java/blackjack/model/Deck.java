package blackjack.model;

import java.util.ArrayList;
import java.util.Collections;


/**
 *
 * @author Chayenne Jacques
 */
public class Deck {

    private ArrayList<Card> cards;

    public Deck() {
        this.cards = new ArrayList();
    }
    public void clear()
    {
        this.cards=new ArrayList<>();
    }
/**
 * alle suites en ranks overlopen en in een kaart steken, zodat je 52 verschillende kaarten krijgt
 */
    public void fillDeck() {
        Card c;
        for (Suit s : Suit.values()) {
            for (Rank r : Rank.values()) {
                if(r!=Rank.SmallAce)
                {
                c = new Card(s, r);
                cards.add(c);
                }
            }
        }
    }
    
    /**
     * de stapel kaarten door elkaar schudden
     */
    public void shuffle(){
        Collections.shuffle(cards);
    }
    
    /**
     * de eerste kaart van de stapel trekken
     * @return 
     */
    public Card drawCard(){
        return cards.get(0);
    }
    
    /**
     * de getrokken kaart verwijderen van de stapel
     * @param c 
     */
    public void removeCard(){
        cards.remove(0);
    }
    
    

}
