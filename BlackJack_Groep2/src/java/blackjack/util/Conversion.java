
package blackjack.util;

import blackjack.model.Headuser;
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
    
        public static List<User> convertResultsetToList(ResultSet rs) {
        List <User> list = new ArrayList();
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
        public static Headuser convertResultSetToHeaduser(ResultSet rs)
        {
            Headuser headuser=null;
            Icon icon=null;
            String nickname, iconname, iconpath, email, password;
            int balance;
            try{
                while(rs.next())
                {
                   nickname=rs.getString("Nickname");
                   iconname=rs.getString("Iconname");
                   iconpath=rs.getString("Iconpath");
                   email=rs.getString("Emailadres");
                   password=rs.getString("Wachtwoord");
                   balance=rs.getInt("Balance");
                icon=new Icon(iconname,iconpath);
            headuser=new Headuser(nickname,balance,password,email,icon);
             
                }
            }
            catch(SQLException ex)
            {
                
            }
           return headuser;
            
        }
            
}
