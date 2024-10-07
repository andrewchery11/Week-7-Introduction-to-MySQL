package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import projects.exception.DbException;

public class DbConnection {
    private static final String HOST = "localhost";
    private static final String PASSWORD = "projects";
    private static final String PORT = "3306";
    private static final String SCHEMA = "projects";
    private static final String USER = "projects";
 

    public static Connection getConnection() {
        String uri = "jdbc:mysql://" + HOST + ":" + PORT + "/" + SCHEMA;
        try {
            return DriverManager.getConnection(uri, USER, PASSWORD);
        } catch (SQLException e) {
            throw new DbException("Connection to database failed", e);
        }
    }
}