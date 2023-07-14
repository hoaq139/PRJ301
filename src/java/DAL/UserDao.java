package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDao extends BaseDAO<User>{
    public User getAccountByUsernameAndPassword(String user, String pass) {
        try {
            String sql = "SELECT *FROM Users WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user);
            statement.setString(2, pass);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User a = new User();
                a.setId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setRoles(rs.getInt(4));
                a.setFullname(rs.getString(5));

                return a;
            }
        } catch (Exception e) {
        }
        return null;

    }
    public User checkAccountExist(String user) {
        try {
            String sql = "SELECT *FROM Users WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User a = new User();
                a.setId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setFullname(rs.getString(5));

                return a;
            }
        } catch (Exception e) {
        }
        return null;

    }
    public void insertAccount(User s) {
        try {
            String sql = "INSERT INTO [dbo].[Users]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[roleId]\n"
                    + "           ,[fullname])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getUsername());
            statement.setString(2, s.getPassword());
            statement.setInt(3, s.getRoles());
            statement.setString(4, s.getFullname());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public User getUserById(int id) {
        try {
            String sql = "SELECT *FROM Users WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User a = new User();
                a.setId(rs.getInt(1));
                a.setUsername(rs.getString(2));
                a.setPassword(rs.getString(3));
                a.setFullname(rs.getString(5));

                return a;
            }
        } catch (Exception e) {
        }
        return null;

    }
    public void change(User user){
        String sql="update Users set password = ? where username = ?";
        try{
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getPassword());
            statement.setString(2, user.getUsername());
            statement.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
    public static void main(String[] args) {
        UserDao d = new UserDao();
        System.out.println(d.getUserById(1).toString());
    }
    
}
