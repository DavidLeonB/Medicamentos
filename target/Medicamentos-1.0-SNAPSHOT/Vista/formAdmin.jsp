<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <h1>Bienvenido, <%= usuario %>!</h1>
            <p>Estamos felices de que estés aquí.</p>
        <%
            } else {
        %>
            <h1>Error: Usuario no logueado</h1>
            <p>Por favor, <a href="inicio.jsp">inicia sesión</a>.</p>
        <%
            }
        %>
    </body>
</html>
