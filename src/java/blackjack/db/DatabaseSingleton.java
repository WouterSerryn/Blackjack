package blackjack.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Chayenne Jacques
 */
public class DatabaseSingleton {

    public static DatabaseSingleton ref;
    private Connection connection;

    private DatabaseSingleton() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static DatabaseSingleton getDatabaseSingleton() {
        if (ref == null) {
            ref = new DatabaseSingleton();
        }
        return ref;
    }

    public Connection getConnection(boolean autoCommit) {
        try {
            connection = DriverManager.getConnection(
                    DatabaseProperties.HOSTNAME,
                    DatabaseProperties.USERNAME,
                    DatabaseProperties.PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

}
