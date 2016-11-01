
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

    public Dealer() {
        this.hand = new Hand();
        this.icon = new Icon("Jafar","images/jafar.png");
        this.minimumStand = 17;
        this.minimumDraw = 16;
    }
    
    public Hand getHand(){
        return hand;
    }
    
    public void setMinimumDraw(int draw){
        this.minimumDraw = draw;
    }

    public Icon getIcon() {
        return icon;
    }
}
