
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
    private Gamestate gamestateId;

    public History(int gameId, User user, int bet, int balance, Gamestate gamestateId) {
        this.gameId = gameId;
        this.user = user;
        this.bet = bet;
        this.balance = balance;
        this.gamestateId = gamestateId;
    }
    
    
    
    
    
}
