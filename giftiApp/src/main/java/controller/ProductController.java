package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
			view = list(request, response);
			
		} else if(PATH.equals("/giftUpdateView.product")) {
			view = updateView(request, response);
			
		} else if(PATH.equals("/giftUpdate.product")) {
			view = update(request, response);
			
		}else if(PATH.equals("/giftInsertView.product")) {
			view = insertView(request, response);
			
		} else if(PATH.equals("/giftInsert.product")) {
			view = insert(request, response);
			
		} else if(PATH.equals("/giftDelete.product")) {
			view = delete(request, response);
			
		} else if(PATH.equals("/giftInfo.product")) {
			view = info(request, response);

		} else if(PATH.equals("/findCategory.product")) {
	        view = findCategory(request, response);
	        
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}
	private String list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("products",dao.findAll());
		return "/product/productList.jsp";
	}
	
	private String updateView(HttpServletRequest request, HttpServletResponse response) {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		request.setAttribute("product", dao.find(itemId));
		request.setAttribute("categories", dao.getCategory());
		return "/product/productUpdate.jsp";
	}
	
	private String update(HttpServletRequest request, HttpServletResponse response) {
		ProductDTO dto = new ProductDTO();
		String itemId = request.getParameter("item_id");
		dto.setItemId(Integer.parseInt(itemId));
		dto.setItemName(request.getParameter("item_name"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setBrand(request.getParameter("brand"));
		dto.setCategory(request.getParameter("category"));
		dto.setImage(request.getParameter("image"));
		
		dao.Update(dto);
		return "giftList.product";
	}
	
	private String insertView(HttpServletRequest request, HttpServletResponse response) {
		int currentItemId = dao.getCurrentItemId();
		request.setAttribute("itemId", currentItemId);
		request.setAttribute("categories", dao.getCategory());
		return "/product/productInsert.jsp";
	}
	
	private String insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = request.getRealPath("/productImages");
		int size = 1024 * 1024 * 5;
		
		MultipartRequest multi = new MultipartRequest(request,
				path, size, "UTF-8", new DefaultFileRenamePolicy());
		
		ProductDTO dto = new ProductDTO();
		dto.setItemId(Integer.parseInt(multi.getParameter("item_id")));
		dto.setItemName(multi.getParameter("item_name"));
		dto.setPrice(Integer.parseInt(multi.getParameter("price")));
		dto.setBrand(multi.getParameter("brand"));
		dto.setCategory(multi.getParameter("category"));
		dto.setImage(multi.getFilesystemName("image"));
		
		dao.insert(dto);
		return "giftInsertView.product";
	}
	
	private String delete(HttpServletRequest request, HttpServletResponse response) {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		dao.delete(itemId);
		
		return "giftList.product";
	}
	
	private String info(HttpServletRequest request, HttpServletResponse response) {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		request.setAttribute("product", dao.find(itemId));
		return "/product/productInfo.jsp";
	}
	
	private String findCategory(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
        request.setAttribute("products", dao.findCategoryAll(category));
      	return "/product/productList.jsp";
	}

}
