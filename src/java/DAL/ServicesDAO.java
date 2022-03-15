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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Room;
import model.Services;

/**
 *
 * @author win
 */
public class ServicesDAO extends BaseDAO<Services> {

    public List<Services> getAllService() {
        List<Services> list = new ArrayList<>();
        try {
            String sql = "SELECT *FROM services";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Services s = new Services();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setPrice(rs.getInt(3));
                s.setTime(rs.getString(4));
                list.add(s);
            }
        } catch (SQLException e) {
        }
        return list;

    }

    public Services getService(int id) {
        try {
            String sql = "select *from services where id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Services r = new Services();
                r.setId(rs.getInt(1));
                r.setName(rs.getString(2));
                r.setPrice(rs.getInt(3));
                r.setTime(rs.getString(4));
                r.setId(id);
                return r;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertService(Services s) {
        try {
            String sql = "INSERT INTO [dbo].[services]\n"
                    + "           ([name]\n"
                    + "           ,[price]\n"
                    + "           ,[time])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getName());
            statement.setInt(2, s.getPrice());
            statement.setString(3, s.getTime());

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateService(Services s) {
        try {
            String sql = "UPDATE services SET name = ?, price= ?, time =? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getName());
            statement.setInt(2, s.getPrice());
            statement.setString(3, s.getTime());
            statement.setInt(4, s.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteService(int id) {
        try {
            String sql = "DELETE Services WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        ServicesDAO dao = new ServicesDAO();
        List<Services> s = dao.getAllService();
        for (Services services : s) {
            System.out.println(services);
        }

    }

}
