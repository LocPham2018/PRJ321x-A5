/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbaccess;

import connector.DBConnect;
import entity.Users;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author AMIN
 */
public class UserDAO {
    
    public void add(Users u) throws Exception {
        String insert = "insert into webmail.accounts values (?, ?)";
        try (Connection conn = new DBConnect().getConnection()) {
            PreparedStatement ps = conn.prepareStatement(insert);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.execute();
        }
    }
    
    public Users selectByUser(String username) throws Exception {
        String select = "select * from webmail.accounts where username = ?";
        Users u = null;
        try (Connection conn = new DBConnect().getConnection()) {
            PreparedStatement ps = conn.prepareStatement(select);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new Users(rs.getString(1), rs.getString(2));
            }
        }
        return u;
    }
    
}
