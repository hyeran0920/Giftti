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

@WebServlet("/product/*.do")
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
		
		if(PATH.equals("/giftList.do")) {
			
			request.setAttribute("products",dao.findAll());
			view = "/product/productList.jsp";
			
		} else if(PATH.equals("/giftUpdateView.do")) {
			
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			request.setAttribute("product", dao.find(itemId));
			request.setAttribute("brands", dao.getBrand());
			request.setAttribute("categories", dao.getCategory());
			view = "/product/productUpdate.jsp";
			
		} else if(PATH.equals("/giftUpdate.do")) {
			
			ProductDTO dto = new ProductDTO();
			String itemId = request.getParameter("item_id");
			dto.setItemId(Integer.parseInt(itemId));
			dto.setItemName(request.getParameter("item_name"));
			dto.setPrice(Integer.parseInt(request.getParameter("price")));
			dto.setBrand(request.getParameter("brand"));
			dto.setCategory(request.getParameter("category"));
			dto.setImage(request.getParameter("image"));
			
			dao.Update(dto);
			view = "/product/giftUpdateView.do?itemId=" + itemId;
			
		}else if(PATH.equals("/giftInsertView.do")) {
			
			int currentItemId = dao.getCurrentItemId();
			request.setAttribute("itemId", currentItemId);
			request.setAttribute("brands", dao.getBrand());
			request.setAttribute("categories", dao.getCategory());
			view = "/product/productInsert.jsp";
			
		} else if(PATH.equals("/giftInsert.do")) {
			
			ProductDTO dto = new ProductDTO();
			dto.setItemId(Integer.parseInt(request.getParameter("item_id")));
			dto.setItemName(request.getParameter("item_name"));
			dto.setPrice(Integer.parseInt(request.getParameter("price")));
			dto.setBrand(request.getParameter("brand"));
			dto.setCategory(request.getParameter("category"));
			dto.setImage(request.getParameter("image"));
			
			dao.insert(dto);
			view = "/product/giftInsertView.do";
		} else if(PATH.equals("/giftDelete.do")) {
			
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			dao.delete(itemId);
			
			view = "/product/giftList.do";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}

}
