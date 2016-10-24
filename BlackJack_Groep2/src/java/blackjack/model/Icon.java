
package blackjack.model;

import java.net.URI;

/**
 *
 * @author Chayenne Jacques
 */
public class Icon {
    
    private String iconname;
    private URI iconimage;

    public Icon(String iconname, URI iconimage) {
        this.iconname = iconname;
        this.iconimage = iconimage;
    }
    
    public String getIconname(){
        return this.iconname;
    }
    
    public URI getIconimage(){
        return this.iconimage;
    }
    
    
}
