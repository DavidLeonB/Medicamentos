
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
        int epsId = Integer.parseInt(request.getParameter("epsId"));
        List<Ips> ipsList = ipsDAO.getIpsByEpsId(epsId);

        // Convertir la lista a JSON
        String json = new Gson().toJson(ipsList);

        // Configurar la respuesta
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
}

