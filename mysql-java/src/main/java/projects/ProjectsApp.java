package projects;

import java.sql.Connection;
import projects.dao.DbConnection;

public class ProjectsApp {
    public static void main(String[] args) {
        try (Connection conn = DbConnection.getConnection()) {
            System.out.println("Connection successful!");
        } catch (Exception e) {
            System.out.println("Connection failed: " + e.getMessage());
        }
    }
}
