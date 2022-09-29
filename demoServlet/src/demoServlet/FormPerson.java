package demoServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/form-nguoi-dung"})
public class FormPerson extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter printWriter = resp.getWriter();

        printWriter.println("<form action='/them-nguoi-dung' method= 'post'>");
        printWriter.println("Tên: <input type='text' name='ten'>");
        printWriter.println("Tuổi: <input type='text' name='tuoi'>");
        printWriter.println("Địa chỉ : <input type='text' name='diachi'>");
        printWriter.println(" <input type='submit' value='submit'>");
        printWriter.println("</form>");
    }
}
