package com.wifi.publicwifilocator;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    static Connection conn = null;

    // Connection 객체를 얻어오기 위한 DBConnect()
    public static Connection DBConnect() {
        try {
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection("jdbc:sqlite:/Users/hjkim/PublicWifiLocator/PublicWiFiLocator/identifier.sqlite");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return conn;
    }
}
