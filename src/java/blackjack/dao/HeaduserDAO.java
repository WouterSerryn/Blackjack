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
public class HeaduserDAO {

    public static ResultSet getHeadUser() {
        String query = "SELECT * from user,headuser, icon where user.Id=headuser.Id and icon.Id=user.IconId";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException e) {
        }
        return rs;
    }

    public static void editHeaduserPassword(String password) {
        String query = "UPDATE headuser SET password = '" + password + "'";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);

        Statement stmt = null;
        try {
            stmt = con.createStatement();
            stmt.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public static ResultSet authenticateHeaduser(String email, String password)
    {
        String query = "SELECT count(*) as result from headuser where Email='"+email+"' and Password=+'"+password+"'";
        Connection con = DatabaseSingleton.getDatabaseSingleton().getConnection(true);
        Statement stmt = null;
        ResultSet rs = null;
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
        } catch (SQLException e) {
            System.out.println("error authenticat dao");
        }
        return rs;
    }

}
