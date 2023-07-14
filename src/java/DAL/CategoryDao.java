package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.User;

public class CategoryDao extends BaseDAO<Category> {

    public List<Category> getAllCategorys() {
        List<Category> list = new ArrayList<>();
        try {
            String sql = "SELECT *FROM Category";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category r = new Category();
                r.setId(rs.getInt(1));
                r.setName(rs.getString(2));
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;

    }

    public Category getCategoryById(int id) {
        try {
            String sql = "SELECT *FROM [Category] WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Category r = new Category();
                r.setId(rs.getInt(1));
                r.setName(rs.getString(2));
                return r;
            }
        } catch (Exception e) {
        }
        return null;

    }

    public void insertCategory(Category s) {
        try {
            String sql = "INSERT INTO [dbo].[Category]\n"
                    + "           ([Name])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getName());

            statement.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public void deleteCategory(int id) {
        try {
            String sql = "DELETE Category WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public void updateCategory(Category s) {
        try {
            String sql = "UPDATE [dbo].[Category]\n"
                    + "   SET [Name] = ?\n"
                    + " WHERE ID =  ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getName());
            statement.setInt(2, s.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public static void main(String[] args) {
        CategoryDao dao = new CategoryDao();
//        List<Category> list = dao.getAllCategorys();
//        for (Category category : list) {
//            System.out.println(category);
//
//        }
        dao.updateCategory(new Category("Sportsss"));
    }
}
