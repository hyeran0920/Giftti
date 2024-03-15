package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;

@WebServlet("/product/*")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProductDAO dao;   
	
    public ProductController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new ProductDAO();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String view = "";
		
		if(PATH.equals("productView.do")) {
			request.setAttribute("products",dao.findAll());
			view = "/product/productList.jsp";
		} else if(PATH.equals("productInfo.do")) {
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			request.setAttribute("product", dao.find(itemId));
			view = "/product/productInfo.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}

}
