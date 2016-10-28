/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package blackjack.model;

/**
 *
 * @author Wouter
 */
public enum Rank {
    /**
     * aan elke rank wordt een waarde toegekend
     * de constructor plaatst dan de waarde van de rank in value
     */
    Ace(11), 
    Two(2), 
    Three(3), 
    Four(4), 
    Five(5), 
    Six(6), 
    Seven(7), 
    Eight(8), 
    Nine(9), 
    Ten(10), 
    Jack(10), 
    Queen(10), 
    King(10);
   private int value;
    
    /**
     * constructor die de aangegeven waarde van de rank in value plaatst
     * @param value 
     */
    private Rank(int value) {
			this.value = value;
		}
    /**
     * retourneert de value
     * @return 
     */
    public int getValue()
    {
        return this.value;
    }
}
