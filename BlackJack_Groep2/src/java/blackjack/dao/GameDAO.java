package blackjack.dao;

import blackjack.db.DatabaseSingleton;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Chayenne Jacques
 */
public class GameDAO {

    public static ResultSet selectLargestId(String table){
    String query = "SELECT max(ID) from " + table;
    Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);
    ResultSet rs = null;
    Statement stmt = null;

    
        try {
            stmt = con.createStatement();
        rs = stmt.executeQuery(query);
    }
    catch (SQLException e

    
        ) {
            e.printStackTrace();
    }
    return rs ;
}
}
