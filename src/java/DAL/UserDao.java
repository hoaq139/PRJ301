package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
    public ArrayList<User> getAll(){
        try {
            String sql = "Select u.id, u.fullname, u.[password], u.username, r.Id from Users u " +
                    "Left JOIN Role r "+
                    "ON u.roleId = r.Id";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<User> list = new ArrayList<>();
            while(rs.next()){
                User person = new User();
                person.setId(rs.getInt("id"));
                person.setUsername(rs.getString("username"));
                person.setFullname(rs.getString("fullname"));
                person.setRoles(rs.getInt("Id"));
                person.setPassword(rs.getString("password"));
                list.add(person);
                
            }
            return list;
        } catch (SQLException ex) {
            System.out.println(ex);
                    
        }
        return null;
    }
    public void update(String fullname, int roles , String username, String password, int id){
        try {
            String sql = "UPDATE Users SET fullname = ?, roleId = ?, username = ?, password = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setInt(2, roles);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setInt(5, id);
            ps.execute();
            
                
                
                
            
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
    }
    public void delete(int id){
        try {
            String sql = "DELETE FROM Users WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            ps.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        UserDao d = new UserDao();
        System.out.println(d.getUserById(1).toString());
    }
    
}
