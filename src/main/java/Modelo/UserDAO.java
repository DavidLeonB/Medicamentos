
package Modelo;


import java.sql.*;

public class UserDAO {
    private String url = "jdbc:mysql://localhost:3306/medical";
    private String user = "root";
    private String password = "";

    public boolean validarCredenciales(String nombre, String contrasena) {
        String sql = "SELECT * FROM usuarios WHERE nombre = ? AND contrasena = ?";
        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement statement = connection.prepareStatement(sql)) {
             
            statement.setString(1, nombre);
            statement.setString(2, contrasena);
            ResultSet resultSet = statement.executeQuery();

            return resultSet.next(); // Si hay un registro, las credenciales son válidas
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
