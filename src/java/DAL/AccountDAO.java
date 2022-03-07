/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author win
 */
public class AccountDAO extends BaseDAO<Account> {

    public Account getAccountByUsernameAndPassword(String user, String pass) {
        try {
            String sql = "SELECT *FROM Account WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user);
            statement.setString(2, pass);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUser(rs.getString(2));
                a.setPass(rs.getString(3));
                a.setEmail(rs.getString(4));

                return a;
            }
        } catch (Exception e) {
        }
        return null;

    }
    public Account getAdminByUsernameAndPassword(String user, String pass) {
        try {
            String sql = "SELECT *FROM Admin WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user);
            statement.setString(2, pass);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUser(rs.getString(2));
                a.setPass(rs.getString(3));
                a.setEmail(rs.getString(4));

                return a;
            }
        } catch (Exception e) {
        }
        return null;

    }

    public Account checkAccountExist(String user) {
        try {
            String sql = "SELECT *FROM Account WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Account a = new Account();
                a.setId(rs.getInt(1));
                a.setUser(rs.getString(2));
                a.setPass(rs.getString(3));
                a.setEmail(rs.getString(4));

                return a;
            }
        } catch (Exception e) {
        }
        return null;

    }

    public void insertAccount(Account s) {
        try {
            String sql = "INSERT INTO Account (username, [password], email)\n"
                    + "VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
//           statement.setInt(1, s.getId());
            statement.setString(1, s.getUser());
            statement.setString(2, s.getPass());
            statement.setString(3, s.getEmail());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
