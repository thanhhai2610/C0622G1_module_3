package controller;

import model.HoKhau;
import model.ThanhVien;
import service.HoKhauService;
import service.IHoKhauService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HoKhauServlet", urlPatterns = "/hokhau")
public class HoKhauServlet extends HttpServlet {

    IHoKhauService hoKhauService = new HoKhauService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                edit(request, response);
                break;

            default:
                hoKhauList(request, response);
                break;
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                viewThanhVien(request, response);
                break;
            case "search":
                search(request, response);
                break;

            default:
                hoKhauList(request, response);
                break;
        }


    }

    private void search(HttpServletRequest request, HttpServletResponse response) {

    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int maHoKhau = Integer.parseInt(request.getParameter("maHoKhau"));
        String tenChuHo = request.getParameter("tenChuHo");
        int soLuongThanhVien = Integer.parseInt(request.getParameter("soLuongThanhVien"));
        String ngayLapHoKhau = (request.getParameter("ngayLapHoKhau"));
        String diaChi = (request.getParameter("diaChi"));

        HoKhau hoKhau = new HoKhau(maHoKhau, tenChuHo, soLuongThanhVien, ngayLapHoKhau, diaChi);

        hoKhauService.updateHoKhau(hoKhau);
        hoKhauList(request, response);

    }

    private void viewThanhVien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ThanhVien> thanhVienList = hoKhauService.selectThanhVienID(Integer.parseInt(request.getParameter("maHoKhau")));
        request.setAttribute("thanhVienList", thanhVienList);
        request.getRequestDispatcher("/xemDanhSachHK.jsp").forward(request, response);
    }

    private void hoKhauList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<HoKhau> hoKhauList = hoKhauService.selectAllHoKhau();
        request.setAttribute("hoKhauList", hoKhauList);
        request.getRequestDispatcher("/hoKhauList.jsp").forward(request, response);
    }
}
