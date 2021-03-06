package controller;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductController", urlPatterns = {"/product", "/"})
public class ProductController extends HttpServlet {
    //mô phỏng DI
    private IProductService iProductService = new ProductService();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createProduct(request, response);
                break;
            }
            case "edit": {
                iProductService.updateProducts(request,response);
                break;
            }
            case "delete": {
                iProductService.showDeleteForm(request,response);
                break;
            }
        }
    }


    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Integer id = (int) (Math.random() * 1000);
        String name = request.getParameter("name");
        Double price = Double.valueOf(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String produce = request.getParameter("produce");
        Product product = new Product(id, name, price, describe, produce);
        Map<String, String> map = iProductService.save(product);
        if (map.isEmpty()) {
            response.sendRedirect("/product");
        } else {
            request.setAttribute("error", map);
            request.getRequestDispatcher("product/create.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("create.jsp").forward(request, response);
                break;
            }
            case "edit": {
                iProductService.showEditForm(request,response);
                break;
            }
            case "delete": {
                iProductService.deleteProduct(request,response);
                break;
            }
            case "search": {
                String name = request.getParameter("name");
                List<Product> productList = iProductService.search(name);
                request.setAttribute("products", productList);
                request.getRequestDispatcher("list.jsp").forward(request, response);
                break;
            }
            default:
                showList(request, response);
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = iProductService.getListProduct();
        request.setAttribute("products", productList);
        try {
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }else{
            request.setAttribute("product",product);
            dispatcher = request.getRequestDispatcher("view.jsp");
        }
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
