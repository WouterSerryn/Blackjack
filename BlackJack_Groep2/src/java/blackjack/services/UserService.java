
package blackjack.services;

import blackjack.dao.UserDAO;
import blackjack.model.Icon;
import blackjack.model.User;
import blackjack.util.Conversion;
import java.util.List;

/**
 *
 * @author Chayenne Jacques
 */
public class UserService {
    
    public static List <User> getUsers(){
        return Conversion.convertResultsetToListUsers(UserDAO.getUsers());
    }
    
    public static void addUser(User user) {
        String nickname = user.getNickname();
        int balance = user.getBalance();
        int iconId=1; //iconId van de default icon
        UserDAO.addUser(nickname, balance, iconId);
    }
    
    public static void removeUser(String nickname){
        UserDAO.removeUser(nickname);
    }
    
    public static void editUser(User user){
        String nickname = user.getNickname();
        int balance = user.getBalance();
        String iconname = user.getIcon().getIconName();
        int iconId = IconService.getIdByIconName(iconname);
        UserDAO.editUser(nickname, balance, iconId);
    }
    
    public static int getUserIdByNickname(String nickname){
        return Conversion.convertResultSetToInt(UserDAO.getUserIdByNickname(nickname));
    }
    
    public static User getUserByNickname(String nickname){
        return Conversion.convertResultSetToUser(UserDAO.getUserByNickname(nickname));
    }
    
    public static List<User> getUsersExcludingHeadUser(){
        return Conversion.convertResultsetToListUsers(UserDAO.getUsersExcludingHeadUser());
    }
    
}
