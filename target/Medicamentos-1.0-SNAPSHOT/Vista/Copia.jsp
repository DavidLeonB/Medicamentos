<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ComboBox desde SQL</title>
</head>
<body>
    <h2>Selecciona una Opción</h2>
    <form action="formCliente.jsp" method="post">
        <select name="miComboBox">
            <%
                // Configura la conexión a la base de datos
                String url = "jdbc:mysql://localhost:3306/medical";
                String user = "root";
                String password = "";
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    // Establecer la conexión
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(url, user, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM eps"; // Ajusta según tu tabla
                    resultSet = statement.executeQuery(sql);

                    // Llenar el ComboBox
                    while (resultSet.next()) {
                        String nombre = resultSet.getString("nombre");
            %>
                        <option value="<%= nombre %>"><%= nombre %></option>
            <%
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                } finally {
                    // Cerrar los recursos
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </select>
        <input type="submit" value="Enviar">
    </form>
</body>
</html>