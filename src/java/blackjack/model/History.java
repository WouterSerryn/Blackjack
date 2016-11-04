
package blackjack.model;

/**
 *
 * @author Chayenne Jacques
 */
public class History {
    
    private int gameId;
    private User user;
    private int bet;
    private String gamestate;
    private String date;

    public History(int gameId, User user, int bet, String gamestate, String date) {
        this.gameId = gameId;
        this.user = user;
        this.bet = bet;
        this.gamestate = gamestate;
        this.date = date;
    }

    public int getGameId() {
        return gameId;
    }

    public User getUser() {
        return user;
    }

    public int getBet() {
        return bet;
    }

    public String getGamestate() {
        return gamestate;
    }

    public String getDate() {
        return date;
    }
    
    
 
}
