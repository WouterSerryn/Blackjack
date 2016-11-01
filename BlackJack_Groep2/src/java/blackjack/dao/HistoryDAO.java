package blackjack.dao;

import blackjack.db.DatabaseSingleton;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Chayenne Jacques
 */
public class HistoryDAO {

    public static ResultSet getAllHistory() {
        String query = "SELECT * from history, game, gamestate, user where game.id = history.gameid and user.id = history.userid and gamestate.id = history.gamestateid";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static void addHistory(int userId, int gameId, int bet, int balance, int gamestateId) {
        String query = "INSERT into history (UserId, GameId, Bet, Balance, GameStateId) VALUES ('" + userId + "','" + gameId + "','" + bet + "','" + balance + "','" + gamestateId + "')";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);

        Statement stmt = null;
        try {
            stmt = con.createStatement();
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
