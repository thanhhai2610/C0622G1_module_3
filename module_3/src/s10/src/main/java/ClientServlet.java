import model.Client;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ClientServlet", value = "/client")
public class ClientServlet extends HttpServlet {

    private static List<Client> clients = new ArrayList<>();

    static {
        clients.add(new Client("Nguyễn Thanh Hải", "26/10/1997", "Duy Xuyên, Quảng Nam", "img\\avata.jpg"));
        clients.add(new Client("Cát Uyên", "03/08/1999", "THanh Khê, Đà nẵng", "img\\avata.jpg"));
        clients.add(new Client("Lê Bá Hoàng Giang", "03/08/1999", "Quảng Bình", "img\\avata.jpg"));
        clients.add(new Client("Quốc Việt", "03/08/1999", "Tam Kì, Quảng Nam", "img\\avata.jpg"));
        clients.add(new Client("Phạm Quang Vinh ", "03/08/1999", "Lệ THuỷ, Quảng Nam", "img\\avata.jpg"));
        clients.add(new Client("Thế Sơn ", "03/08/1999", "Vin Home, Đà Nẵng", "img\\avata.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display.jsp");
        request.setAttribute("clients", clients);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    }
}