
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
    
}
