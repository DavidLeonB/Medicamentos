<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Google Font -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap"
            rel="stylesheet"
            />
        <!-- CSS -->
        <link rel="stylesheet" href="Styles/style.css" />
        <!-- Icons -->
        <link
            href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
            rel="stylesheet"
            />
        
        
        
        <title>Formulario de registro e inicio de sesión</title>
    </head>
    <body>


        <!-- Formulario Registrarse -->

        <div class="container-form register hide" >
            <div class="information">
                <div class="info-childs">
                    <h2>Bienvenido</h2>
                    <p>Eres un miembro importante para nuestra comunidad.</p>
                    <input type="button" value="Iniciar Sesión" id="sign-in" />
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Crear una Cuenta</h2>
                    <!-- <div class="icons">
                        <i class="bx bxl-whatsapp"></i>
                        <i class="bx bxl-instagram"></i>
                    </div> -->   
                    <p class="datos">Ingresa tus datos</p>
                    <form action="svtUsuarios" method="POST" class="form">
                        <input type="hidden" name="action" value="registrar" />
                        <!-- <label>Nombre</label> -->
                        <i class="bx bxs-user"></i>
                        <input type="text" name="txtnombre" placeholder="Nombre" />
                        <!-- <label>Apellido</label> -->
                        <i class="bx bxs-user"></i>
                        <input type="text" name="txtapellido" placeholder="Apellido" />
                        <!-- <label>Telefono</label> -->
                        <i class="bx bxs-phone-call"></i>
                        <input type="text" name="txttelefono" placeholder="Telefono" />
                        <!-- <label>Contraseña</label> -->
                        <i class="bx bxs-lock-open-alt"></i>
                        <input type="text" name="txtcontrasena" placeholder="Contraseña" />

                        <!-- Combo Box para EPS -->
                        <i class='bx bx-plus-medical'></i>
                        <select name="id_eps" style="width: 92%; margin-bottom: 5px; padding: 10px; background-color: transparent; border: solid 2px #0315af; outline: none; border-radius: 20px; font-size: 1rem; color: #555;">
                            <option value="">Selecciona EPS</option>
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

                        <!-- Combo Box para IPS -->
                        <i class='bx bxs-capsule'></i>
                        <select name="id_ips" style="width: 92%; margin-bottom: 5px; padding: 10px; background-color: transparent; border: solid 2px #0315af; outline: none; border-radius: 20px; font-size: 1rem; color: #555;">
                            <option value="">Proveedor de Medicina</option>
                            
                        </select>
                        <i class='bx bx-edit-alt'></i>
                        <input class="registrarse" type="submit" value="Registrarse" />

                    </form>

                </div>
            </div>
        </div>





        <!-- Formulario Iniciar Sesión -->

        <div class="container-form login" >
            <div class="information">
                <div class="info-childs">

                    <h2>Bienvenido</h2>
                    <p>Te invitamos a ser parte de nuestra comunidad.</p>
                    <input type="button" value="Registrarse" id="sign-up" />
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Iniciar Sesión</h2>
                    <div class="icons">
                        <i class="bx bxl-whatsapp"></i>
                        <i class="bx bxl-instagram"></i>
                    </div>
                    <p class="datos">Ingresa tus datos</p>
                    <form action="srvUsuario" method="POST" class="form">
                        <input type="hidden" name="accion" value="verificar" /> 
                        <!-- <label>Nombre</label> -->
                        <i class="bx bxs-user"></i>
                        <input type="text" name="nombre" placeholder="Nombre" />
                        <!-- <label>Apellido</label> 
                        <i class="bx bxs-user"></i>
                        <input type="text" name="apellido" placeholder="Apellido" />-->
                        <!-- <label>Telefono</label> 
                        <i class="bx bxs-phone-call"></i>
                        <input type="text" name="telefono" placeholder="Telefono" />-->
                        <!-- <label>Contraseña</label> -->
                        <i class="bx bxs-lock-open-alt"></i>
                        <input type="text" name="contrasena" placeholder="Contraseña" />
                        <i class='bx bx-log-in'></i>
                        <input class="registrarse" type="submit" value="Iniciar Sesión" />
                    </form>

                </div>
            </div>
        </div>
        <script src="script.js"></script>
    </body>|
</html>

