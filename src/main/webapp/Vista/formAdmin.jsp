<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

            .container_btn {
                display:  flex;
                padding: 25px;
                align-content: center;
                align-items: center;
                border-radius:  20px;
                height:  80px;
                max-width:  100%;
                transition:  all 1s ease;
                justify-content: space-around;
                border:  solid thin #0315af;
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
                background-color:  #3fb7ee;
                border-top-left-radius:  20px;
                border-bottom-left-radius:  20px;
                border:  solid thin red;
            }

            .container_btn input:hover {
                background-color:  var(--aqua);
                border:  var(--gris);
                color:  var(--azul_oscuro);
                font-size:  1.3rem;
                box-shadow:  10px 10px 10px rgba(83, 87, 100, 0.4);
            }


        </style>
        <title>Bienvenida</title>
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
        <p>Estamos felices de que estés aquí.</p>
        <%
        } else {
        %>
        <h1>Error: Usuario no logueado</h1>
        <p>Por favor, <a href="inicio.jsp">inicia sesión</a>.</p>
        <%
            }
        %>


        <div class="container_btn">
            <input class="Boton1" type="submit" value="Boton1" />

            <input class="Boton2" type="submit" value="Boton2" />


            <input class="Boton3" type="submit" value="Boton3" />

        </div>

    </body>
</html>
