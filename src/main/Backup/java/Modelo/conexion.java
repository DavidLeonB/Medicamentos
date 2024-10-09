package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/medical";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Método para establecer la conexión a la base de datos
    public Connection conexion() throws SQLException {
        Connection connection = null;

        try {
            // Establecer la conexión
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión exitosa!");
        } catch (SQLException e) {
            System.out.println("ERROR conexión: " + e.getMessage());
            throw e; // Lanzar la excepción para que se maneje más arriba
        }
        
        return connection; // Retornar la conexión
    }
    
     public static void main(String[] args) {
        conexion con = new conexion();
        try {
            Connection connection = con.conexion();
            // Aquí puedes hacer algo con la conexión si deseas

            // Recuerda cerrar la conexión si la has abierto
            if (connection != null) {
                connection.close();
                System.out.println("Conexión cerrada.");
            }
        } catch (SQLException e) {
            System.out.println("Error en la conexión: " + e.getMessage());
        }
    }
}





