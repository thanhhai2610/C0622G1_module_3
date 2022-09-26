package svlet_life_cycle;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletLifeCycle", urlPatterns = "/ServletLifeCycle")
public class ServletLifeCycle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Chạy vào hàm doGet ");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Chạy vào hàm doPost ");

    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
        System.out.println("Chạy vào hàm service ");
    }

    @Override
    public void init() throws ServletException {
        System.out.println("Chạy vào hàm khỏi tạo ");
    }

    @Override
    public void destroy() {
        System.out.println("Đã huỷ");
    }
}
