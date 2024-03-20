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
		
		if(PATH.equals("/allList.trans")) {
	         System.out.println("거래 리스트");
	      
	         request.setAttribute("transactions", dao.findAll());
	         view = "/trans/transList.jsp";
	            
	      } else if(PATH.equals("/sellInfo.trans")) {
			
			int registerId = Integer.parseInt(request.getParameter("registerId"));
			request.setAttribute("saleItem", dao.findSaleInfo(registerId));
			view = "/product/saleProductInfo.jsp";
			
		} else if(PATH.equals("/productSaleList.trans")) {
			
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			request.setAttribute("saleItems", dao.findSaleItem(itemId));
			view = "/product/productSaleList.jsp";
			
		} else if(PATH.equals("/saleDelete.trans")){
			
			int registerId = Integer.parseInt(request.getParameter("registerId"));
			int itemId = dao.getItemId(registerId);
			dao.deleteSale(registerId);
			view = "productSaleList.trans?itemId=" + itemId;
		} else if(PATH.equals("/selltransList.trans")) {
	         //완료 거래
	         String isSale = "Sold";
	         
	         request.setAttribute("transactions", dao.findSoldOut(isSale));
	         view = "/trans/transList.jsp";
	   }else if(PATH.equals("/transList.trans")) {
	         //미 거래 내역
	         String isSale = "Available"   ;
	         request.setAttribute("transactions", dao.findSoldOut(isSale));
	         view = "/trans/transList.jsp";
	      }

		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
