
package blackjack.model;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author Chayenne Jacques
 */
public class Game {
    
  private Dealer dealer;
  private ArrayList<User> players;
  private Deck deck;
  private Calendar date;

    public Game(ArrayList<User> players) throws URISyntaxException {
        this.dealer = new Dealer();
        this.deck = new Deck();
        this.players = players;
        this.date= Calendar.getInstance();
    }
  
  
  
    
    
}
