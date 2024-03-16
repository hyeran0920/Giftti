package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TransDAO;

@WebServlet("*.trans")
public class TransController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TransDAO dao;
    public TransController() {
        super();
    }


	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		dao = new TransDAO();
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String view = "";
		
		if(PATH.equals("sellList.trans")) {
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			request.setAttribute("saleItems", dao.findSaleItem(itemId));
			request.setAttribute("itemName", request.getAttribute("itemName"));
			view = "/product/productSaleList.jsp";
		} else if(PATH.equals("sellInfo.trans")) {
			int registerId = Integer.parseInt(request.getParameter("registerId"));
			request.setAttribute("saleItem", dao.findSaleInfo(registerId));
			view = "/product/saleProductInfo.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
