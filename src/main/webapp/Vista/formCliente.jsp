<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- CSS -->
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
                background-color: rgba(255, 255, 255, 0.5);
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
                background-color: rgba(255, 255, 255, 0.5);
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
                flex-direction: column;
                align-items: center; /* Centra el contenido */
            }

            .container_perfil input{
                width:  100%;
                height:  40px;
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
                margin: 10px;
                align-items: center;
            }


            input {
                width:  25%;
                height:  60px;
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
            // Obtener la sesión actual
            HttpSession userSession = request.getSession(false);
            String usuario = null;

            if (session != null) {
                usuario = (String) session.getAttribute("usuario");
            }

            // Comprobar si el usuario está logueado
            if (usuario != null) {
        %>
        <h1>Bienvenido, <%= usuario%>!</h1>
        <h4>Estamos felices de que estes con nosotros, aqui puedes Consultar, Generar, Separar tus medicamentos.</h4>

        <div></div>
        <div class="container_perfil">
            <div class="perfil">
                <div class="datos">
                    <div>
                        <p>Nombre </p>
                        <input type="text" value="Datos" />
                    </div>
                    <div>
                        <p>Apellido</p>
                        <input type="text" value="Datos" />
                    </div>

                    <div>
                        <p>Telefono</p>
                        <input type="text" value="Datos" />
                    </div>

                    <div>
                        <p>EPS </p>
                        <input type="text" value="Datos" />
                    </div>

                    <div>
                        <p>Dispensador de Medicina</p>
                        <input type="text" value="Datos" />
                    </div>
                </div>       
            </div>
            <div class="actualizaciones">
                <div class="acciones">


                    <input class="Boton1" type="submit" value="Actualizar Datos" />
                    <input class="Boton1" type="submit" value="Cerrar Sesión" />
                </div>
            </div>
        </div>


        <div class="container_btn">
            <input class="Boton1" type="submit" value="Consultar Medicamentos" />
            <input class="Boton2" type="submit" value="Generar Reporte" />
            <input class="Boton3" type="submit" value="Separar" />
        </div>
        <%
            } else {
                // Redirigir a la página de inicio de sesión
                response.sendRedirect("ErrorCredenciales.jsp");
            }
        %>
    </body>
</html>

