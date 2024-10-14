<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="" />
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <style>

            :root {
                --azul_oscuro: #0315af;
                --azul-claro: #3fb7ee;
                --negro: #111;
                --gris: #555;
                --gris2: #9191bd;
                --blanco: #fff;
                --aqua: #92def5;
            }

            body {
                height: 100vh;
                background-image: url("../img/medical3.jpg");
                background-size: cover;
            }

            .saludo{
                margin-bottom: 15px;
            }

            .container_btn {
                display: flex;
                padding: 15px;
                align-content: center;
                align-items: center;
                border-radius: 20px;
                height: 65px;
                max-width: 100%;
                transition: all 1s ease;
                justify-content: space-around;
                border: solid thin #0315af;
                margin: 5px;
                background-color: rgba(176,196,222,0.5);
            }

         

          .perfil {
    display: flex;
    justify-content: space-between;
    padding: 20px;
    border-radius: 20px;
    border: #0315af solid 1px;
    margin-bottom: 10px;
    background-color: rgba(176,196,222,0.5);
}

.datos {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 10px;
    flex: 2; /* Permite que la sección de datos ocupe más espacio */
}

            .datos input {
    width: 95%; /* Cambiar a 100% para que ocupen todo el espacio disponible */
    height: 60px;
    font-size: 1rem;
    border-radius: 20px;
    text-align: center;
    border: solid thin #0315af;
}

            .container_perfil input {
                width: 100%;
                height: 60px;
                font-size: 1rem;
                border-radius: 20px;
                text-align: center;
                border: solid thin #0315af;
            }

            .actualizaciones {
                width: 30%;
                display: flex;
                margin: 15px;
                align-items: center;
                text-align: center;
                background-color: transparent;
                border-radius: 20px;
                border: solid thin yellow;
            }

          .acciones {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    flex: 1; /* Sección de acciones ocupa menos espacio */
}

.acciones input {
    width: 80%; /* Cambiar el ancho de los botones */
    margin: 10px 0; /* Espaciado vertical entre botones */
}
            input {
                width: 30%;
                height: 60px;
                font-size: 1rem;
                border-radius: 20px;
                text-align: center;
                border: solid thin #0315af;
            }

            .container_btn input:hover,
            .actualizaciones input:hover,
            .saludo input:hover {
                background-color: var(--aqua);
                border: var(--azul_oscuro);
                color: var(--azul_oscuro);
                font-size: 1.3rem;
                box-shadow: 10px 10px 10px rgba(83, 87, 100, 0.4);
            }


        </style>
        <title>Bienvenida Cliente</title>
    </head>
    <body>

        <%
            HttpSession userSession = request.getSession(false);
            String usuario = null;
            String nombre = "";
            String apellido = "";
            String telefono = "";
            String eps = "";
            String dispensador = "";

            if (userSession != null) {
                usuario = (String) userSession.getAttribute("usuario");

                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical", "root", "");

                    String sql = "SELECT usuarios.nombre, usuarios.apellido, usuarios.telefono, "
                            + "eps.nombre AS eps_nombre, ips.nombre AS ips_nombre "
                            + "FROM usuarios "
                            + "JOIN eps ON usuarios.id_eps = eps.id_eps "
                            + "JOIN ips ON usuarios.id_ips = ips.id_ips "
                            + "WHERE usuarios.nombre = ?";

                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, usuario);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        nombre = rs.getString("usuarios.nombre");
                        apellido = rs.getString("usuarios.apellido");
                        telefono = rs.getString("usuarios.telefono");
                        eps = rs.getString("eps_nombre");
                        dispensador = rs.getString("ips_nombre");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) {
                            rs.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    try {
                        if (stmt != null) {
                            stmt.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    try {
                        if (conn != null) {
                            conn.close();
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }

            if (usuario != null) {
        %>
        <div class="saludo"><h1>Bienvenido, <%= usuario%> </h1>
        <h4>Estamos felices de que estés con nosotros, aquí puedes Consultar, Generar, Separar tus medicamentos.</h4>
        <input class="Perfil" type="submit" value="Perfil" />
        <input class="Consultar" type="submit" value="Consultar" />
        </div>
        
        <div class="perfil">
            <div class="datos">
                <div>
                    <p>Nombre</p>
                    <input type="text" value="<%= nombre%>" name="txtnombre" disabled/>
                </div>
                <div>
                    <p>Apellido</p>
                    <input type="text" value="<%= apellido%>" name="txtapellido" disabled/>
                </div>
                <div>
                    <p>Teléfono</p>
                    <input type="text" value="<%= telefono%>" name="txttelefono" disabled/>
                </div>
                <div>
                    <p>EPS</p>
                    <input type="text" value="<%= eps%>" name="txteps" disabled/>
                </div>
                <div>
                    <p>Dispensador de Medicina</p>
                    <input type="text" value="<%= dispensador%>" name="txtips" disabled/>
                </div>
           
        </div>
        <div class="actualizaciones">
            <div class="acciones">
                <input class="actualizar" type="button" value="Actualizar Datos" onclick="habilitarInputs()"/>
                <input class="actualizar" type="submit" value="Guardar Cambios" />
                <input class="cerrarSesion" type="submit" value="Cerrar Sesión" />
            </div>
        </div>
    </div>
 </div>
    <div class="container_btn">
        <input class="consultar" type="submit" value="Consultar Medicamentos" />
        <input class="separar" type="submit" value="Separar Medicamentos" />
        <input class="generar" type="submit" value="Generar Reporte" />
    </div>
    <%
        } else {
            response.sendRedirect("ErrorCredenciales.jsp");
        }
    %>

    <script>
        function habilitarInputs() {
            const inputs = document.querySelectorAll('.datos input[type="text"]:not([name="txteps"]):not([name="txtips"])');
            inputs.forEach(input => {
                input.disabled = false; // Habilitar input
            });
        }
    </script>
</body>
</html>
