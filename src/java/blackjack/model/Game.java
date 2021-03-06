package blackjack.model;

import blackjack.services.HistoryService;
import blackjack.services.UserService;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;

/**
 *
 * @author Chayenne Jacques
 */
public class Game {

    public static Game game;
    private Dealer dealer;
    private ArrayList<User> players;
    private Deck deck;
    private Calendar date;

    public Game() {

        this.dealer = new Dealer();
        this.deck = new Deck();
        this.date = Calendar.getInstance();
        this.date.add(Calendar.DATE, 0);
        System.out.println("date of today: " + date.getTime());
    }

    public void setPlayerList(ArrayList<User> players) {
        this.players = players;
    }

    public static Game getGame() {
        if (game == null) {
            game = new Game();
        }
        return game;
    }

    /**
     * kaart wordt van deck gehaald en toegevoegd aan de hand van User user
     *
     * @param user
     */
    public void playerHit(User user) {
        Card c = deck.drawCard();
        deck.removeCard();
        user.getHand().addCard(c);
        user.getHand().evaluate();
    }

    /**
     * de dealer trekt een kaart, kaart wordt van deck gehaald en toegevoegd aan
     * de hand van de dealer
     */
    public void dealerHit() {
        Card c = deck.drawCard();
        deck.removeCard();
        dealer.getHand().addCard(c);
        dealer.getHand().evaluate();
    }

    /**
     * kaarten verdelen, elke speler/dealer krijgt 2 kaarten, de 2e kaart van de
     * dealer is onzichtbaar
     */
    public void cardDistribution() {
        for (int i = 0; i < 2; i++) {
            Iterator<User> it = players.iterator();
            while (it.hasNext()) {
                User user = it.next();
                playerHit(user);
            }
            dealerHit();
            if (i == 1) {
                dealer.getHand().getCards().get(1).setVisibility(false);
            }
        }
    }

    public void playerStand(User user) {
        user.getHand().setState(Handstate.Stand);
    }

    public void dealerStand() {
        dealer.getHand().setState(Handstate.Stand);
    }

    /**
     * vergelijkt de hands van de spelers tov de hand van de dealer
     */
    public void evaluateGame() {
        Iterator<User> it = players.iterator();
        while (it.hasNext()) {
            User user = it.next();
            if (user.getHand().getState() == Handstate.Blackjack) {
                user.setGamestate(Gamestate.Win);
            } else if (dealer.getHand().getState() == Handstate.Blackjack && user.getHand().getState() != Handstate.Blackjack) {
                user.setGamestate(Gamestate.Loss);
            } else if (user.getHand().getState() == Handstate.Busted) {
                user.setGamestate(Gamestate.Loss);
            } else if (dealer.getHand().getState() == Handstate.Busted) {
                user.setGamestate(Gamestate.Win);
            } else if (user.getHand().getValue() > dealer.getHand().getValue()) {
                user.setGamestate(Gamestate.Win);
            } else if (user.getHand().getValue() == dealer.getHand().getValue()) {
                user.setGamestate(Gamestate.Push);
            } else if (user.getHand().getValue() < dealer.getHand().getValue()) {
                user.setGamestate(Gamestate.Loss);
            }

        }
    }

    /**
     * credits aftrekken/toevoegen van de balance van de spelers obv hun
     * gamestate
     */
    public void distributePayment() {
        Iterator<User> it = players.iterator();
        while (it.hasNext()) {
            User user = it.next();
            if (user.getState().equals(Gamestate.Loss)) {
                //niets doen..
            } else if (user.getState().equals(Gamestate.Push)) {
                user.setBalance((int) (user.getBalance() + user.getBet()));
            } else if (user.getState().equals(Gamestate.Win)) {
                if (user.getHand().getState().equals(Handstate.Stand)) {
                    user.setBalance((int) (user.getBalance() + (user.getBet() * 2)));
                } else if (user.getHand().getState().equals(Handstate.Blackjack)) {
                    user.setBalance((int) (user.getBalance() + (user.getBet() * 2.5)));
                }
            }
            UserService.editUser(user);
        }
        HistoryService.addHistory(this);
    }

    public String getDate() {
        String formattedDate = new SimpleDateFormat("dd-MM-yyyy").format(date.getTime());
        System.out.println("Formatted date " + formattedDate);
        return formattedDate;
    }

    public Dealer getDealer() {
        return dealer;
    }

    public ArrayList<User> getPlayers() {
        return players;
    }

    public Deck getDeck() {
        return deck;
    }

    public void dealerPlay() {
        Iterator<User> users = players.iterator();
        Boolean needToPlay = false;
        while (users.hasNext()) {
            if (users.next().getHand().getState() != Handstate.Busted) {
                needToPlay = true;
                break;
            }
        }
        if (needToPlay) {
            if (dealer.getHand().getState() != Handstate.Blackjack) {
                int minimumStand = 21;
                Iterator<User> it = this.players.iterator();
                while (it.hasNext()) {
                    User player = it.next();
                    if (player.getHand().getValue() < minimumStand) {
                        minimumStand = player.getHand().getValue();
                    }
                }
                if (minimumStand == 21) {
                    minimumStand = 16;
                } else if (minimumStand < 17) {
                    minimumStand = 16;
                }
                while (this.dealer.getHand().getValue() < minimumStand + 1) {
                    dealerHit();
                    dealer.getHand().evaluate();
                }
                if (dealer.getHand().getValue() <= 21) {
                    dealer.getHand().setState(Handstate.Stand);
                }
            }
        }
    }
}
