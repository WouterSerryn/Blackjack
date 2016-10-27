
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
    
    public List<Icon> getIcons(){
        return Conversion.convertResultSetToListIcons(IconDAO.getIcons());
    }
    
    public static void addIcon(String name, String path){
        IconDAO.addIcon(name, path);
    }
    
    public static int getIdByIconName(String iconname){
        return Conversion.convertResultSetToInt(IconDAO.getIconIdByIconName(iconname));
    }
    
}
