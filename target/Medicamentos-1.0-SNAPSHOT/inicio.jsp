
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <style>
        
        .form i {
            color: #0315af;
            font-size: 1.5rem;
        }

        select {
            width: 92%;
            margin-bottom: 5px;
            padding: 10px;
            border: solid 2px #0315af;
            outline: none;
            border-radius: 20px;
            font-size: 1rem;
            color: #0315af;
        }
    </style>
        <title>Formulario de registro e inicio de sesión</title>
    </head>
    <body>


        <!-- Formulario Registrarse -->
        <div class="container-form register hide">
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
                    <form action="" method="POST" class="form">
                        <input type="hidden" name="action" value="registrar" />
                        <i class="bx bxs-user"></i>
                        <input type="text" name="txtnombre" placeholder="Nombre" required />
                        <i class="bx bxs-user"></i>
                        <input type="text" name="txtapellido" placeholder="Apellido" required />
                        <i class="bx bxs-phone-call"></i>
                        <input type="text" name="txttelefono" placeholder="Teléfono" required />
                        <i class="bx bxs-lock-open-alt"></i>
                        <input type="password" name="txtcontrasena" placeholder="Contraseña" required />
                        <i class='bx bx-plus-medical'></i>

                        <!-- Combo Box para EPS -->
                        <select 
                                

                                name="id_eps" id="eps" onchange="loadIps(this.value)" required>

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
                                    String sql = "SELECT * FROM eps";
                                    resultSet = statement.executeQuery(sql);

                                    // Llenar el ComboBox
                                    while (resultSet.next()) {
                                        String nombre = resultSet.getString("nombre");
                                        int id_eps = resultSet.getInt("id_eps");
                            %>
                            <option value="<%= id_eps%>"><%= nombre%></option>
                            <%
                                    }
                                } catch (SQLException | ClassNotFoundException e) {
                                    e.printStackTrace();
                                } finally {
                                    // Cerrar los recursos
                                    try {
                                        if (resultSet != null) {
                                            resultSet.close();
                                        }
                                        if (statement != null) {
                                            statement.close();
                                        }
                                        if (connection != null) {
                                            connection.close();
                                        }
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                }
                            %>
                        </select>

                        <!-- Combo Box para IPS -->
                        <i class='bx bxs-capsule'></i>
                        <select

                             name="id_ips" id="ips" required>
                            <option value="">Selecciona IPS</option>
                        </select>
                        <i class='bx bxs-edit'></i>
                        <input class="registrarse" type="submit" value="Registrarse" />


                    </form>

                </div>
            </div>
        </div>





        <!-- Formulario Iniciar Sesión -->
        <div class="container-form login">
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
                    <form action="" method="POST" class="form">
                        <input type="hidden" name="accion" value="verificar" />
                        <i class="bx bxs-user"></i>
                        <input type="text" name="nombre" placeholder="Nombre" required />
                        <i class="bx bxs-lock-open-alt"></i>
                        <input type="password" name="contrasena" placeholder="Contraseña" required />
                        <i class='bx bx-log-in'></i>
                        <input class="registrarse" type="submit" value="Iniciar Sesión" />
                    </form>

                </div>
            </div>

            <script src="script.js"></script>
            <script>
                                    function loadIps(epsId) {
                                        const ipsSelect = document.getElementById('ips');
                                        ipsSelect.innerHTML = '<option value="">Cargando...</option>'; // Muestra un mensaje de carga

                                        // Llamada a un servlet para cargar las IPS según la EPS seleccionada
                                        fetch(`loadIps?epsId=${epsId}`)
                                                .then(response => response.json())
                                                .then(data => {
                                                    ipsSelect.innerHTML = '<option value="">Selecciona IPS</option>';
                                                    data.forEach(ips => {
                                                        ipsSelect.innerHTML += `<option value="${ips.id_ips}">${ips.nombre}</option>`;
                                                    });
                                                })
                                                .catch(err => {
                                                    console.error(err);
                                                    ipsSelect.innerHTML = '<option value="">Error al cargar IPS</option>';
                                                });
                                    }
            </script>
    </body>
</html>
