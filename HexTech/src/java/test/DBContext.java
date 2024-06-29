package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBContext implements DatabaseInfo {
    
    static {
        try {
            Class.forName(DRIVERNAME);
            System.out.println("Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Failed to load driver");
        }
    }

    public Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(DBURL, USERDB, PASSDB);
        System.out.println("Connected to database");
        return conn;
    }

    public void closeConnection(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
            System.out.println("Connection closed");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User validateUser(String email, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;
        try {
            conn = getConnection();
            String sql = "SELECT * FROM [User] WHERE email = ? AND password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            System.out.println("Executing query: " + ps);
            rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("User found: " + rs.getString("email"));
                user = new User(
                    rs.getInt("userID"),
                    rs.getString("fullName"),
                    rs.getString("email"),
                    rs.getString("phoneNumber"),
                    rs.getString("address"),
                    rs.getInt("roleID"),
                    rs.getString("password")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, ps, rs);
        }
        return user;
    }

    public static void main (String[] args) {
        User user = new DBContext().validateUser("admin@example.com", "adminpassword");
        if (user != null) {
            System.out.println("User: " + user.toString());
        } else {
            System.out.println("User not found");
        }
    }
}