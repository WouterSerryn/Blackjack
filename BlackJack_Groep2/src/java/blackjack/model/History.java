
package blackjack.model;

/**
 *
 * @author Chayenne Jacques
 */
public class History {
    
    private int gameId;
    private User user;
    private int bet;
    private int balance;
    private String gamestate;
    private String date;

    public History(int gameId, User user, int bet, int balance, String gamestate, String date) {
        this.gameId = gameId;
        this.user = user;
        this.bet = bet;
        this.balance = balance;
        this.gamestate = gamestate;
        this.date = date;
    }
    
    
    
    
    
}
