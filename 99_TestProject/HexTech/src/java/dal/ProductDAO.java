package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import model.Products;
import java.sql.Date;

/**
 *
 * @author hotaru
 */
public class ProductDAO extends DBContext {

    public ArrayList<Products> listAll() {
        ArrayList<Products> list = new ArrayList<Products>();
        connection = getConnection();
        String sql = "Select productID, title, created_at, price, quantity, [description] from Product";
        try {
            preStatement = connection.prepareStatement(sql);
            resultSet = preStatement.executeQuery();
            while (resultSet.next()) {
                int productID = resultSet.getInt("productID");
                String title = resultSet.getString("title");
                Date create_at = resultSet.getDate("created_at");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String desc = resultSet.getString("[description]");
                Products pro = new Products(productID, title, create_at, price, quantity, desc);
                //Products pro = new Products(resultSet.getInt(1) , resultSet.getString(2), resultSet.getDate(3), resultSet.getDouble(4), resultSet.getInt(5), resultSet.getString(6));
                list.add(pro);
            }
            connection.close();
            return list;
        } catch (SQLException ex) {

        }
        return null;
    }

    public static void main(String args[]) {
        ArrayList<Products> products = new ProductDAO().listAll();
        for (Products pr : products) {
            System.out.println(pr.toString());
        }
    }
}
