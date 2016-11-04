package blackjack.model;

/**
 *
 * @author Chayenne Jacques
 */
public class History {

    private int gameId;
    private User user;
    private String gamestate;
    private String date;

    public History(int gameId, User user, String gamestate, String date) {
        this.gameId = gameId;
        this.user = user;
        
        this.gamestate = gamestate;
        this.date = date;
    }

    public int getGameId() {
        return gameId;
    }

    public User getUser() {
        return user;
    }

    public String getGamestate() {
        return gamestate;
    }

    public String getDate() {
        return date;
    }

}
