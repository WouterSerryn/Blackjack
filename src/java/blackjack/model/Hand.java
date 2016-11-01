
package blackjack.model;

import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Chayenne Jacques
 */
public class Hand {
    
    private ArrayList<Card> cards;
    private Handstate state;

    public Hand() {
        this.cards = new ArrayList();
    }
    
    /**
     * Card c toevoegen aan de Hand na de kaartverdeling of Hit
     * @param c 
     */
    public void addCard(Card c){
        cards.add(c);
    }
    /**
     * evalueren of de state van een hand verandert (na een hit en na de kaartverdeling)
     */
    public void evaluate(){
        int value=this.getValue();
        if(value>21)
        {
            boolean foundReduceableAce=false;
            Card c;
           Iterator<Card> it=this.cards.iterator();
           while(it.hasNext())
           {
               c=it.next();
               if(c.getValue()==11)
               {
                   c.setRankToSmallAce();
                   foundReduceableAce=true;
                  
                   break;
               }
               
           }
           if(!foundReduceableAce)
           {
            this.setState(Handstate.Busted);
           }
        }
        else if(value==21 && this.cards.size()==2)
        {
           this.setState(Handstate.Blackjack);
        }
        else if(value==21 && this.cards.size()>2)
        {
           this.setState(Handstate.Stand);
        }

    }
    public void clear()
    {
        this.cards=new ArrayList<>();
        this.state=null;
    }
   
    public void setState(Handstate hs){
        this.state = hs;
    }
    
    public Handstate getState(){
        return this.state;
    }
    
    public ArrayList<Card> getCards(){
        return cards;
    }
    
    public int getValue(){
        int value = 0;
        Iterator <Card> it = cards.iterator();
        while (it.hasNext()){
            value+= it.next().getValue();
        }
        return value;
    }
    
}
