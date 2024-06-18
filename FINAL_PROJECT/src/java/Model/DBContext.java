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
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DBURL, USERDB, PASSDB);
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
            rs = ps.executeQuery();
            if (rs.next()) {
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
    
    public static void main (String[] a) {
        
        new DBContext().validateUser("admin@example.com", "adminpassword");
    }
}
