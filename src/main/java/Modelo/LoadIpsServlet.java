
package Modelo;

import com.google.gson.Gson;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class LoadIpsServlet extends HttpServlet {
    private IpsDAO ipsDAO = new IpsDAO();

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        int epsId = Integer.parseInt(request.getParameter("epsId"));
        List<Ips> ipsList = ipsDAO.getIpsByEpsId(epsId);
        
        // Depuración
    System.out.println("IPS: " + ipsList);
        
        // Convertir la lista a JSON
        String json = new Gson().toJson(ipsList);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    } 
         catch (NumberFormatException ex) {
        ex.printStackTrace();
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid EPS ID");}
    
    catch (Exception e) {
        e.printStackTrace(); // Esto imprimirá el error en la consola del servidor
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("Error en el servidor: " + e.getMessage());
    }
}


}

