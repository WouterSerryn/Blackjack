<%-- 
    Document   : info
    Created on : 26-okt-2016, 12:57:48
    Author     : Chayenne Jacques
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welkom bij Blackjack!</h1>
        <p>Blackjack is een tafelspel dat met kaarten tegen dealer/bank wordt gespeeld (niet tegen andere spelers).
            Het doel is om meer punten dan de dealer te hebben, maar niet meer dan 21.</p>

        <p>Bij het begin van het spel dient elke speler zijn inzet in te geven (minimum 1).
            Nadat iedere speler een inzet heeft geplaatst krijgt elke speler 2 kaarten.</p>
            
        <p>Waarden van de kaarten: <br>
            De kaarten 2 tot en met 10 hebben dezelfde waarde als de cijfers op de kaarten<br>
            De boer, vrouw en koning hebben ook een waarde van 10. <br>
            Een aas kan de waarde 1 of 11 hebben.
        </p>
            
        <p> Mogelijkheden: <br>
            Heb je meteen 21 punten met de eerste 2 kaarten? Dan heb je Blacjack en krijg je direct 1,5 keer je inzet.
            Heb je met de eerste 2 kaarten een waarde lager dan 21 punten, dan kan je een extra kaart vragen (Hit). Je mag zoveel kaarten blijven vragen tot je 21 punten of meer hebt.
            Je mag ook passen (Stand).<br>
            Heb je meer punten dan de dealer, heb je een "win": je krijgt 1 keer je inzet terug.<br>
            Als de waarde van je kaarten hoger is dan 21 heb je verloren (Bust), je inzet wordt van je credits afgetrokken.
            Heb je evenveel punten als de dealer (Push), krijg je je inzet terug.<br>
            Heeft de dealer "blackjack", dan worden alle inzetten geïncasseerd (behalve van de spelers met "blackjack"). <br>
            Heeft de dealer "bust": alle spelers zonder "bust" krijgen 1 keer hun inzet terug.</p>
        
            <p>De dealer is als laatste aan de beurt en deze speelt met vaste regels: bij 16 punten of minder zal deze om een extra kaart vragen, bij 17 of meer zal deze passen.</p>

            </body>
</html>
