
package blackjack.model;

import com.sun.xml.xsom.impl.util.Uri;
import java.net.URI;
import java.net.URISyntaxException;

/**
 *
 * @author Chayenne Jacques
 */
public class Dealer {
    
    private Icon icon;
    private Hand hand;
    private int minimumStand;
    private int minimumDraw;

    public Dealer() throws URISyntaxException {
        this.hand = new Hand();
        this.icon = new Icon("naam",new URI("path"));
        this.minimumStand = minimumStand;
        this.minimumDraw = minimumDraw;
    }
    
    public Hand getHand(){
        return hand;
    }
    
    
}
