/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connector;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author AMIN
 */
public class DBConnect {
    
    private final String serverName = "localhost";
    private final String dbName = "webmail";
    private final String portNumber = "3306";
    private final String userID = "root";
    private final String password = "Vah@11a94";
    
    public Connection getConnection() throws Exception {
        String url = "jdbc:mysql://" + serverName + ":" + portNumber + "/" + dbName;
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, userID, password);
    }
    
}
