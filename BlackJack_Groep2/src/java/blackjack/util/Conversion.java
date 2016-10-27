package blackjack.util;

import blackjack.dao.GamestateDAO;
import blackjack.model.Headuser;
import blackjack.model.History;
import blackjack.model.Icon;
import blackjack.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Chayenne Jacques
 */
public class Conversion {

    public static List<User> convertResultsetToListUsers(ResultSet rs) {
        List<User> list = new ArrayList();
        String nickname, iconname, iconpath;
        int balance;

        try {
            while (rs.next()) {
                nickname = rs.getString("nickname");
                balance = rs.getInt("balance");
                iconname = rs.getString("icon.name");
                iconpath = rs.getString("icon.path");
                Icon icon = new Icon(iconname, iconpath);
                User user = new User(nickname, balance, icon);
                list.add(user);
            }
        } catch (SQLException ex) {

        }
        return list;
    }

    public static Headuser convertResultSetToHeaduser(ResultSet rs) {
        Headuser headuser = null;
        Icon icon = null;
        String nickname, iconname, iconpath, email, password;
        int balance;
        try {
            while (rs.next()) {
                nickname = rs.getString("Nickname");
                iconname = rs.getString("Iconname");
                iconpath = rs.getString("Iconpath");
                email = rs.getString("Emailadres");
                password = rs.getString("Wachtwoord");
                balance = rs.getInt("Balance");
                icon = new Icon(iconname, iconpath);
                headuser = new Headuser(nickname, balance, password, email, icon);

            }
        } catch (SQLException ex) {

        }
        return headuser;

    }

    public static List<Icon> convertResultSetToListIcons(ResultSet rs) {
        List<Icon> list = new ArrayList();
        String iconname, iconpath;

        try {
            while (rs.next()) {
                iconname = rs.getString("icon.name");
                iconpath = rs.getString("icon.path");
                Icon icon = new Icon(iconname, iconpath);
                list.add(icon);
            }
        } catch (SQLException ex) {

        }
        return list;
    }

    public static int convertResultSetToInt(ResultSet rs) {
        int res = -1;
        try {
            while (rs.next()) {
                res = rs.getInt("Id");
            }
        } catch (SQLException ex) {

        }
        return res;
    }

    public static User convertResultSetToUser(ResultSet rs) {
        String nickname, iconname, iconpath;
        int balance;
        User user = null;
        Icon icon = null;
        try {
            while (rs.next()) {
                nickname = rs.getString("nickname");
                balance = rs.getInt("balance");
                iconname = rs.getString("name");
                iconpath = rs.getString("path");
                icon = new Icon(iconname, iconpath);
                nickname = rs.getString("Nickname");
                balance = rs.getInt("Balance");
                iconname = rs.getString("icon.Name");
                iconpath = rs.getString("icon.Path");
                icon= new Icon(iconname, iconpath);
                user = new User(nickname, balance, icon);
            }
        } catch (SQLException ex) {
System.out.println("convertresultsettouser problem");
        }
        return user;
    }

    public static List<History> convertResultsetToHistoryList(ResultSet rs) {
        List<History> list = new ArrayList();
        String nickname, iconname, iconpath, date, gamestate;
        int balance, bet, gameid, gamestateid;

        try {
            while (rs.next()) {
                gameid = rs.getInt("game.id");
                date = rs.getString("date");
                gamestate = rs.getString("gamestate.name");
                nickname = rs.getString("nickname");
                balance = rs.getInt("balance");
                iconname = rs.getString("icon.name");
                iconpath = rs.getString("icon.path");
                bet = rs.getInt("bet");
                
                Icon icon = new Icon(iconname, iconpath);
                User user = new User(nickname, balance, icon);
                History history = new History(gameid, user, bet, balance, gamestate, date);
                list.add(history);
            }
        } catch (SQLException ex) {

        }
        return list;
    }

}
