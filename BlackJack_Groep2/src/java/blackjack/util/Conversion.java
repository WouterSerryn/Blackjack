package blackjack.util;

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

    public static List<Icon> convertResultSetToListIcons(ResultSet rs) {
        List <Icon> list = new ArrayList();
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

}
