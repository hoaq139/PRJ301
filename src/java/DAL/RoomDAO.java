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

/**
 *
 * @author win
 */
public class RoomDAO extends BaseDAO<Room> {

    public List<Room> getAllRoom() {
        List<Room> list = new ArrayList<>();
        try {
            String sql = "SELECT *FROM Room";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setId(rs.getInt(1));
                r.setName(rs.getString(2));
                r.setImage(rs.getString(3));
                r.setPrice(rs.getInt(4));
                r.setGuest(rs.getInt(5));
                r.setSquare(rs.getInt(6));
                r.setDescription(rs.getString(7));
                list.add(r);
            }
        } catch (SQLException e) {
        }
        return list;

    }

    public Room getRoom(int id) {
        try {
            String sql = "SELECT name, image, price, guest, square, description FROM Room WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Room s = new Room();
                statement.setString(1, s.getName());
                statement.setString(2, s.getImage());
                statement.setInt(3, s.getPrice());
                statement.setInt(4, s.getGuest());
                statement.setInt(5, s.getSquare());
                statement.setString(6, s.getDescription());

                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertRoom(Room s) {
        try {
            String sql = "INSERT INTO [dbo].[room]\n"
                    + "           ([name]\n"
                    + "           ,[image]\n"
                    + "           ,[price]\n"
                    + "           ,[guest]\n"
                    + "           ,[square]\n"
                    + "           ,[description])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getName());
            statement.setString(2, s.getImage());
            statement.setInt(3, s.getPrice());
            statement.setInt(4, s.getGuest());
            statement.setInt(5, s.getSquare());
            statement.setString(6, s.getDescription());

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateRoom(Room s) {
        try {
            String sql = "UPDATE Room SET name = ?, image = ?, price= ?, guest =?, square =?, description=? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getName());
            statement.setString(2, s.getImage());
            statement.setInt(3, s.getPrice());
            statement.setInt(4, s.getGuest());
            statement.setInt(5, s.getSquare());
            statement.setString(6, s.getDescription());
            statement.setInt(7, s.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteRoom(int id) {
        try {
            String sql = "DELETE Room WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
