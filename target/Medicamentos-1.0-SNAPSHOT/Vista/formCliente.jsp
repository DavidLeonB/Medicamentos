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
    <link rel="stylesheet" href="Styles/style.css" />
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
                height:  100vh;
                background-image:  url("../img/medical3.jpg");
                background-size:  cover;
            }

            .container_btn {
                display:  flex;
                padding: 15px;
                align-content: center;
                align-items: center;
                border-radius:  20px;
                height:  65px;
                max-width:  100%;
                transition:  all 1s ease;
                justify-content: space-around;
                border:  solid thin #0315af;
                margin: 5px;
                background-color: rgba(176, 196, 222, 0.5);
            }

            .container_perfil {
                display:  flex;
                padding: 20px;
                align-content: center;
                align-items: center;
                border-radius:  20px;
                max-width:  100%;
                transition:  all 1s ease;
                justify-content: space-around;
                border:  solid thin red;
                margin-bottom: 10px;
                background-color: rgba(176, 196, 222, 0.5);
            }

            .perfil {
                width: 50%;
                display: flex;
                background-color: transparent;
                border-radius: 20px;
                border: #0315af solid 1px; /* Agrega un grosor */
            }

            .datos {
                display: grid;
                grid-template-columns: repeat(3, 1fr); /* 3 columnas */
                gap: 25px; /* Espacio entre los elementos, ajustado */
                background-color: transparent;
                border-radius: 20px;
                padding: 10px; /* Espacio interno */
            }

            .datos div {
                display: flex;
font-size: 1rem;                
                flex-direction: column;
                align-items: center; /* Centra el contenido */
            }

            .container_perfil input{
                width:  100%;
                height:  40px;
                font-size: 1rem;
                display:  flex;
                align-items: center;
                justify-content:center ;
                align-content: center;
                border-radius:  20px;
                text-align:  center;
                background-color:  transparent;
                border-top-left-radius:  20px;
                border-bottom-left-radius:  20px;
                border:  solid thin #0315af;

            }
            .actualizaciones {
                width:  30%;
                display:  flex;
                align-items:  center;
                text-align:  center;
                background-color:  transparent;
                border-radius: 20px;
                border:#9191bd;
            }

            .acciones{
                width: 100%;
            }

            .acciones input{
                width: 96%;
                font-size: 1rem;
                margin: 10px;
                align-items: center;
            }


            input {
                width:  25%;
                height:  60px;
                font-size: 1rem;
                display:  flex;
                align-items: center;
                justify-content:center ;
                align-content: center;
                border-radius:  20px;
                text-align:  center;
                background-color:  transparent;
                border-top-left-radius:  20px;
                border-bottom-left-radius:  20px;
                border:  solid thin #0315af;
            }

            .container_btn input:hover {
                background-color:  var(--aqua);
                border:  var(--azul_oscuro);
                color:  var(--azul_oscuro);
                font-size:  1.3rem;
                box-shadow:  10px 10px 10px rgba(83, 87, 100, 0.4);
            }
            
            .actualizaciones input:hover {
                background-color:  var(--aqua);
                border:  var(--azul_oscuro);
                color:  var(--azul_oscuro);
                font-size:  1.3rem;
                box-shadow:  10px 10px 10px rgba(83, 87, 100, 0.4);
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
        out.println("Usuario: " + usuario); // Para depuración

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical", "root", "");

            String sql = "SELECT usuarios.nombre, usuarios.apellido, usuarios.telefono, " +
                         "eps.nombre AS eps_nombre, ips.nombre AS ips_nombre " +
                         "FROM usuarios " +
                         "JOIN eps ON usuarios.id_eps = eps.id_eps " +
                         "JOIN ips ON usuarios.id_ips = ips.id_ips " +
                         "WHERE usuarios.nombre = ?"; // Asegúrate de que esto sea correcto

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
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    if (usuario != null) {
%>
    <h1>Bienvenido, <%= usuario %>!</h1>
    <h4>Estamos felices de que estés con nosotros, aquí puedes Consultar, Generar, Separar tus medicamentos.</h4>

    <div class="container_perfil">
        <div class="perfil">
            <div class="datos">
                <div>
                    <p>Nombre</p>
                    <input type="text" value="<%= nombre %>" name="txtnombre" disabled/>
                </div>
                <div>
                    <p>Apellido</p>
                    <input type="text" value="<%= apellido %>" name="txtapellido" disabled/>
                </div>
                <div>
                    <p>Teléfono</p>
                    <input type="text" value="<%= telefono %>" name="txttelefono" disabled/>
                </div>
                <div>
                    <p>EPS</p>
                    <input type="text" value="<%= eps %>" name="txteps" disabled/>
                </div>
                <div>
                    <p>Dispensador de Medicina</p>
                    <input type="text" value="<%= dispensador %>" name="txtips" disabled/>
                </div>
            </div>
        </div>
        <div class="actualizaciones">
            <div class="acciones">
                <input class="Boton1" type="submit" value="Actualizar Datos" name="actualizar" onclick="habilitarInputs()"/>
                <input class="Boton1" type="submit" value="Guardar Cambios" name="cerrar_sesion"/>
                <input class="Boton1" type="submit" value="Cerrar Sesión" name="cerrar_sesion"/>
            </div>
        </div>
    </div>

    <div class="container_btn">
        <input class="Boton1" type="submit" value="Consultar Medicamentos" />
        <input class="Boton2" type="submit" value="Separar Medicamentos" />
        <input class="Boton3" type="submit" value="Generar Reporte" />
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

