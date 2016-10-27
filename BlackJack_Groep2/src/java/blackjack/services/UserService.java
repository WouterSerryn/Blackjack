
package blackjack.services;

import blackjack.dao.UserDAO;
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
    
    public static void addUser(String nickname, int balance, int iconId) {
        UserDAO.addUser(nickname, balance, iconId);
    }
    
    public static void removeUser(String nickname){
        UserDAO.removeUser(nickname);
    }
    
    public static void editUser(String nickname, int balance, int iconId){
        UserDAO.editUser(nickname, balance, iconId);
    }
    
    public static int getUserIdByNickname(String nickname){
        return Conversion.convertResultSetToInt(UserDAO.getUserIdByNickname(nickname));
    }
    
    public static User getUserByNickname(String nickname){
        return Conversion.convertResultSetToUser(UserDAO.getUserByNickname(nickname));
    }
    
}
