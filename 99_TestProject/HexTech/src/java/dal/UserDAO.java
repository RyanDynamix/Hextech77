package dal;

import java.sql.SQLException;
import java.sql.Statement;
import model.User;

public class UserDAO extends DBContext {

    public User findByEmailPassword(String email, String password) {
        //- connect w/database
        connection = getConnection();
        //- Chuẩn bị câu lệnh sql
        String sql = "Select * from [BanHangOnline].[dbo].[User] where email = ? and [password] = ?";
        try {
            //- tạo đối tượng PrepareStatement
            preStatement = connection.prepareStatement(sql);
            //- Set parameter (optional)
            preStatement.setObject(1, email);
            preStatement.setObject(2, password);
            //- Thực thi câu lệnh
            resultSet = preStatement.executeQuery();
            //- Trả về kết quả
            if (resultSet.next()) {
                String fullname_found = resultSet.getString("fullname").trim();
                String email_found = resultSet.getString("email").trim();
                String password_found = resultSet.getString("password").trim();
                String phoneNumber_found = resultSet.getString("phoneNumber").trim();
                String address_found = resultSet.getString("phoneNumber").trim();
                int userID = resultSet.getInt("userID");
                int roleID = resultSet.getInt("roleID");

                User user1 = new User(userID, fullname_found, email_found, phoneNumber_found, address_found, roleID, password_found);
                return user1;
            }
        } catch (SQLException e) {
            System.out.println("??findByEmailPassword: " + e.getMessage());
        }
        return null;
    }

    public void insertUserDB(User user) {
        //- connect w/Database
        connection = getConnection();
        //- Chuan bi cau lenh sql
        String sql = """
                     INSERT INTO [dbo].[User]
                                ([fullName]
                                ,[email]
                                ,[password]
                                ,[phoneNumber])
                          VALUES
                                (?
                                ,?
                                ,?
                                ,?)""";
        try {
            //- Tao doi tuong prepareStatement (thêm generated key vao tham so thu 2)
            preStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            //- set parameter
            preStatement.setObject(1, user.getFullName());
            preStatement.setObject(2, user.getEmail());
            preStatement.setObject(3, user.getPassword());
            preStatement.setObject(3, user.getPhoneNumber());
            //- thuc thi cau lenh
            preStatement.executeUpdate();
            //- tra ve ket qua mới thêm
            resultSet = preStatement.getGeneratedKeys();
        } catch (SQLException e) {
            System.out.println("??insertUserDB: " + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        System.out.println(new UserDAO().findByEmailPassword("user@example.com", "user123").toString());
    }
}
