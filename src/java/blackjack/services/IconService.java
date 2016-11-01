
package blackjack.services;

import blackjack.dao.IconDAO;
import blackjack.model.Icon;
import blackjack.util.Conversion;
import java.util.List;

/**
 *
 * @author Chayenne Jacques
 */
public class IconService {
    
    public static List<Icon> getIcons(){
        return Conversion.convertResultSetToListIcons(IconDAO.getIcons());
    }
    
    public static void addIcon(String name, String path){
        IconDAO.addIcon(name, path);
    }
    
    public static int getIdByIconName(String iconname){
        return Conversion.convertResultSetToId(IconDAO.getIconIdByIconName(iconname));
    }
    
    public static Icon getIconByName(String iconname){
        return Conversion.convertResultSetToIcon(IconDAO.getIconByName(iconname));
    }
    
}
