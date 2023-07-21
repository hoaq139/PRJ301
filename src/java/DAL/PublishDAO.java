/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Publish;

/**
 *
 * @author hoangdinh
 */
public class PublishDAO extends BaseDAO<Publish>{
    public Publish getPublishById(int id) {
        try {
            String sql = "SELECT *FROM [Publish] WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Publish r = new Publish();
                r.setId(rs.getInt(1));
                r.setPublish(rs.getString(2));
                return r;
            }
        } catch (Exception e) {
        }
        return null;

    }
    public List<Publish> getAllCategorys() {
        List<Publish> list = new ArrayList<>();
        try {
            String sql = "SELECT *FROM Publish";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Publish r = new Publish();
                r.setId(rs.getInt(1));
                r.setPublish(rs.getString(2));
                list.add(r);
            }
        } catch (Exception e) {
        }
        return list;

    }
}
