
package Modelo;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class IpsDAO {
    private String url = "jdbc:mysql://localhost:3306/medical";
    private String user = "root";
    private String password = "";

    public List<Ips> getIpsByEpsId(int epsId) {
        List<Ips> ipsList = new ArrayList<>();
        String sql = "SELECT * FROM ips WHERE eps_id = ?";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement statement = connection.prepareStatement(sql)) {
             
            statement.setInt(1, epsId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id_ips");
                String nombre = resultSet.getString("nombre");
                ipsList.add(new Ips(id, nombre));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return ipsList;
    }
}

