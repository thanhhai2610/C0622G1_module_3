package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "FuramaServlet", urlPatterns = "/home")
public class FuramaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "villa":
                villa(request, response);
                break;
            case "house":
                house(request, response);
                break;
            case "room":
                room(request, response);
                break;
            default:
                home(request, response);
                break;
        }
    }

    private void house(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/furama/facility/house/house.jsp");
        dispatcher.forward(request, response);
    }

    private void room(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/furama/facility/room/room.jsp");
        dispatcher.forward(request, response);
    }

    private void villa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/furama/facility/villa/villa.jsp");
        dispatcher.forward(request, response);
    }

    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/home.jsp");
        dispatcher.forward(request, response);
    }
}
