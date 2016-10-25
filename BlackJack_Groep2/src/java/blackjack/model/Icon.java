
package blackjack.model;

import java.net.URI;

/**
 *
 * @author Chayenne Jacques
 */
public class Icon {
    
    private String iconname;
    private String iconimage;

    public Icon(String iconname, String iconimage) {
        this.iconname = iconname;
        this.iconimage = iconimage;
    }
    
    public String getIconname(){
        return this.iconname;
    }
    
    public String getIconimage(){
        return this.iconimage;
    }
    
    
}
