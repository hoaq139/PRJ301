package DAL;

import DAL.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Comment;
import model.News;
import model.User;

public class NewsDao extends BaseDAO<News> {

    public UserDao userDao = new UserDao();
    public CategoryDao categoryDao = new CategoryDao();

    public List<News> getAllNews() {
        List<News> list = new ArrayList<>();
        try {
            String sql = "SELECT *FROM News";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                News r = new News();
                r.setId(rs.getInt(1));
                r.setTitle(rs.getString(2));
                r.setDescription(rs.getString(3));
                r.setImage(rs.getString(4));
                r.setAuthorId(rs.getInt(5));
                User user = userDao.getUserById(r.getAuthorId());
                r.setTimePost(rs.getString(6));
                r.setShortDes(rs.getString(7));
                r.setCategoryId(rs.getInt(8));
                Category category = categoryDao.getCategoryById(r.getCategoryId());
                r.setUser(user);
                r.setCategory(category);
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;

    }

    public List<News> getAllNewsBySearch(String search, String from, String to, int categoryId) {
        List<News> list = new ArrayList<>();
        try {
            String sql = "SELECT *FROM News Where title like ? and timepost between ? and ? and categoryid = ?";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + search + "%");
            statement.setString(2, from);
            statement.setString(3, to);
            statement.setInt(4, categoryId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                News r = new News();
                r.setId(rs.getInt(1));
                r.setTitle(rs.getString(2));
                r.setDescription(rs.getString(3));
                r.setImage(rs.getString(4));
                r.setAuthorId(rs.getInt(5));
                User user = userDao.getUserById(r.getAuthorId());
                r.setTimePost(rs.getString(6));
                r.setShortDes(rs.getString(7));
                r.setCategoryId(rs.getInt(8));
                r.setUser(user);
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;

    }

    public List<News> getAllNewsByCategoryId(int categoryId) {
        List<News> list = new ArrayList<>();
        try {
            String sql = "SELECT *FROM News where categoryId = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                News r = new News();
                r.setId(rs.getInt(1));
                r.setTitle(rs.getString(2));
                r.setDescription(rs.getString(3));
                r.setImage(rs.getString(4));
                r.setAuthorId(rs.getInt(5));
                User user = userDao.getUserById(r.getAuthorId());
                r.setTimePost(rs.getString(6));
                r.setShortDes(rs.getString(7));
                r.setCategoryId(rs.getInt(8));
                Category category = categoryDao.getCategoryById(r.getCategoryId());
                r.setCategory(category);
                r.setUser(user);
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;

    }

    public void insertNews(News s) {
        try {
            String sql = "INSERT INTO [dbo].[News]\n"
                    + "           ([title]\n"
                    + "           ,[description]\n"
                    + "           ,[image]\n"
                    + "           ,[author]\n"
                    + "           ,[timePost]\n"
                    + "           ,[shortDes]\n"
                    + "           ,[categoryId])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getTitle());
            statement.setString(2, s.getDescription());
            statement.setString(3, s.getImage());
            statement.setInt(4, s.getAuthorId());
            statement.setString(5, s.getTimePost());
            statement.setString(6, s.getShortDes());
            statement.setInt(7, s.getCategoryId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteNews(int id) {
        try {
            String sql = "DELETE news WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public News getNewsById(String id) {
        try {
            String sql = "SELECT *FROM News WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                News r = new News();
                r.setId(rs.getInt(1));
                r.setTitle(rs.getString(2));
                r.setDescription(rs.getString(3));
                r.setImage(rs.getString(4));
                r.setAuthorId(rs.getInt(5));
                User user = userDao.getUserById(r.getAuthorId());
                r.setTimePost(rs.getString(6));
                r.setShortDes(rs.getString(7));
                r.setCategoryId(rs.getInt(8));
                Category category = categoryDao.getCategoryById(r.getCategoryId());
                r.setCategory(category);
                r.setUser(user);
                return r;
            }
        } catch (Exception e) {
        }
        return null;

    }

    public void updateNews(News s) {
        try {
            String sql = "UPDATE [dbo].[News]\n"
                    + "   SET [title] = ?\n"
                    + "      ,[description] = ?\n"
                    + "      ,[image] = ?\n"
                    + "      ,[shortDes] = ?\n"
                    + "      ,[categoryId] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getTitle());
            statement.setString(2, s.getDescription());
            statement.setString(3, s.getImage());
            statement.setString(4, s.getShortDes());
            statement.setInt(5, s.getCategoryId());
            statement.setInt(6, s.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
        }
    }

    public static void main(String[] args) {
        NewsDao d = new NewsDao();
        //  List<News> l = d.getAllNewsBySearch("is", "2023-03-10", "2023-03-20", 1);
        List<News> l = d.getAllNews();
        if (l == null) {
            System.out.println("");
        }
        for (News news : l) {
            System.out.println(news.toString());
        }
//        News n = d.getNewsById("5");
//        System.out.println(n.toString());
    }

}
