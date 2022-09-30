package controller;

import model.Product;
import service.IProductService;
import service.iml.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddListProduct(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "edit":
                showEditListProduct(request, response);
                break;
            default:
                showListProduct(request, response);
        }

    }




    private void delete(HttpServletRequest request, HttpServletResponse response) {

        productService.remove(Integer.parseInt(request.getParameter("id")));
        showListProduct(request, response);

    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        String company = request.getParameter("company");
        String madeIn = request.getParameter("madeIn");
        Product product = new Product(id, nameProduct, company, madeIn);
        productService.add(product);

        request.setAttribute("mess", "Thêm mới thành công");
        showAddListProduct(request, response);

    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        String company = request.getParameter("company");
        String madeIn = request.getParameter("madeIn");
        Product product = new Product(id, nameProduct, company, madeIn);

        productService.update(id, product);
        showListProduct(request, response);
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("listProduct", productService.findAll());
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddListProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }
    private void showEditListProduct(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("editProduct", productService.findById(Integer.parseInt(request.getParameter("id"))));
        try {
            request.getRequestDispatcher("view/edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


}
