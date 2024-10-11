
package Modelo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String contrasena = request.getParameter("contrasena");

        if ("admin".equals(nombre) && "admin".equals(contrasena)) {
            // Usuario es admin, redirigir a la página de administración
            HttpSession session = request.getSession();
            session.setAttribute("usuario", nombre);
            response.sendRedirect("Vista/formAdmin.jsp"); // Cambia esto a tu página de administración
        } else if (userDAO.validarCredenciales(nombre, contrasena)) {
            // Credenciales válidas, iniciar sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", nombre);
            response.sendRedirect("Vista/formCliente.jsp"); // Redirige a una página de bienvenida
        } else {
            // Credenciales inválidas, establecer mensaje de error
            request.setAttribute("error", "Credenciales incorrectas. Intenta de nuevo.");
            request.getRequestDispatcher("inicio.jsp").forward(request, response); // Regresa a la página de login
        }
    }
}
