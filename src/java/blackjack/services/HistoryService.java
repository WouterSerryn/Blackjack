package blackjack.services;

import blackjack.dao.GameDAO;
import blackjack.dao.GamestateDAO;
import blackjack.dao.HistoryDAO;
import blackjack.dao.UserDAO;
import blackjack.model.Game;
import blackjack.model.History;
import blackjack.model.User;
import blackjack.util.Conversion;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Chayenne Jacques
 */
public class HistoryService {

    public static void addHistory(Game game) {
        int userid, bet, balance, gamestateId, gameId;
        List<User> users = game.getPlayers();
        Iterator<User> it = users.iterator();
        GameService.addGame(game.getDate());
        gameId = Conversion.convertResultSetToId(GameDAO.selectLargestId("Game"));
        while (it.hasNext()) {
            User user=it.next();
            userid = Conversion.convertResultSetToId(UserDAO.getUserIdByNickname(user.getNickname()));
            bet = user.getBet();
            balance = user.getBalance();
            gamestateId = Conversion.convertResultSetToId(GamestateDAO.getIdByGameState(user.getState().name()));

            HistoryDAO.addHistory(userid, gameId, bet, balance, gamestateId);
        }
    }

    public static List<History> getAllHistory() {
        return Conversion.convertResultsetToHistoryList(HistoryDAO.getAllHistory());
    }

    public static List<History> getHistoryByDate(String date) {
        return Conversion.convertResultsetToHistoryList(HistoryDAO.getHistoryByDate(date));
    }
    
    public static List<History> getHistoryByUser(String nickname){
        return Conversion.convertResultsetToHistoryList(HistoryDAO.getHistoryByUser(nickname));
    }

}
