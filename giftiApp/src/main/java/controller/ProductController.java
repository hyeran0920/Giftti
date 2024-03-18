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
import dto.ProductDTO;

@WebServlet("*.product")
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
		request.setCharacterEncoding("utf-8");
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String view = "";
		System.out.println(PATH);
		
		if(PATH.equals("/giftList.product")) {
			request.setAttribute("products",dao.findAll());
			view = "/product/productList.jsp";
			
		} else if(PATH.equals("/giftUpdateView.product")) {
			
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			request.setAttribute("product", dao.find(itemId));
			request.setAttribute("categories", dao.getCategory());
			view = "/product/productUpdate.jsp";
			
		} else if(PATH.equals("/giftUpdate.product")) {
			
			ProductDTO dto = new ProductDTO();
			String itemId = request.getParameter("item_id");
			dto.setItemId(Integer.parseInt(itemId));
			dto.setItemName(request.getParameter("item_name"));
			dto.setPrice(Integer.parseInt(request.getParameter("price")));
			dto.setBrand(request.getParameter("brand"));
			dto.setCategory(request.getParameter("category"));
			dto.setImage(request.getParameter("image"));
			
			dao.Update(dto);
			view = "giftUpdateView.product?itemId=" + itemId;
			
		}else if(PATH.equals("/giftInsertView.product")) {
			
			int currentItemId = dao.getCurrentItemId();
			request.setAttribute("itemId", currentItemId);
			request.setAttribute("categories", dao.getCategory());
			view = "/product/productInsert.jsp";
			
		} else if(PATH.equals("/giftInsert.product")) {
			
			ProductDTO dto = new ProductDTO();
			dto.setItemId(Integer.parseInt(request.getParameter("item_id")));
			dto.setItemName(request.getParameter("item_name"));
			dto.setPrice(Integer.parseInt(request.getParameter("price")));
			dto.setBrand(request.getParameter("brand"));
			dto.setCategory(request.getParameter("category"));
			dto.setImage(request.getParameter("image"));
			
			dao.insert(dto);
			view = "giftInsertView.product";
		} else if(PATH.equals("/giftDelete.product")) {
			
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			dao.delete(itemId);
			
			view = "giftList.product";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}

}
