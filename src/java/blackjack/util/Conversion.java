package blackjack.util;

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
                iconname = rs.getString("icon.Name");
                iconpath = rs.getString("icon.Path");
                email = rs.getString("Email");
                password = rs.getString("Password");
                balance = rs.getInt("Balance");
                icon = new Icon(iconname, iconpath);
                headuser = new Headuser(nickname, balance, password, email, icon);

            }
        } catch (SQLException ex) {
System.out.println("conversion error");
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

    public static int convertResultSetToId(ResultSet rs) {
        int res = -1;
        try {
            while (rs.next()) {
                res = rs.getInt("Id");
            }
        } catch (SQLException ex) {
                System.out.println("error convertresultsettoId");
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
                nickname = rs.getString("Nickname");
                balance = rs.getInt("Balance");
                iconname = rs.getString("icon.Name");
                iconpath = rs.getString("icon.Path");
                icon = new Icon(iconname, iconpath);
                user = new User(nickname, balance, icon);
            }
        } catch (SQLException ex) {
        }
        return user;
    }

    public static List<History> convertResultsetToHistoryList(ResultSet rs) {
        List<History> list = new ArrayList();
        String nickname, iconname, iconpath, date, gamestate;
        int balance, bet, gameid, gamestateid;

        try {
            while (rs.next()) {
                gameid = rs.getInt("game.Id");
                date = rs.getString("Date");
                gamestate = rs.getString("gamestate.Name");
                nickname = rs.getString("Nickname");
                balance = rs.getInt("history.Balance");
                iconname = rs.getString("icon.Name");
                iconpath = rs.getString("icon.Path");
                bet = rs.getInt("Bet");
                
                Icon icon = new Icon(iconname, iconpath);
                User user = new User(nickname, balance, icon);
                user.setBet(bet);
                History history = new History(gameid, user, gamestate, date);
                list.add(history);
            }
        } catch (SQLException ex) {
            System.out.println("error converttohistory");
        }
        return list;
    }

    public static Icon convertResultSetToIcon(ResultSet rs) {
        String iconname, iconpath;
        Icon icon=null;

        try {
            while (rs.next()) {
                iconname = rs.getString("icon.name");
                iconpath = rs.getString("icon.path");
                icon = new Icon(iconname, iconpath);
            }
        } catch (SQLException ex) {

        } return icon;
    }
    public static int convertResultSetToInt(ResultSet rs)
    {
        int res = 0;
        try {
            while (rs.next()) {
                res = rs.getInt("result");
                
            }
        } catch (SQLException ex) {
                System.out.println("error convertresultsettoint");
        }
        return res;
    }
}
