package blackjack.services;

import blackjack.dao.GameDAO;
import blackjack.dao.GamestateDAO;
import blackjack.dao.HistoryDAO;
import blackjack.dao.UserDAO;
import blackjack.model.Game;
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
        while (it.hasNext()) {
            userid = Conversion.convertResultSetToInt(UserDAO.getUserIdByNickname(it.next().getNickname()));
            bet = it.next().getBet();
            balance = it.next().getBalance();
            gamestateId = Conversion.convertResultSetToInt(GamestateDAO.getIdByGameState(it.next().getState().name()));
            gameId = Conversion.convertResultSetToInt(GameDAO.selectLargestId("Game"));

            HistoryDAO.addHistory(userid, gameId, bet, balance, gamestateId);
        }
    }

}
