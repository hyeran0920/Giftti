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
	      
	         request.setAttribute("transactions", dao.findTransFive());
	         request.setAttribute("saleList", dao.findSaleAvailFIVE());
	         view = "/trans/transSaleList.jsp";
	            
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
			
		}else if(PATH.equals("/saleDeleteList.trans")){
			
			int registerId = Integer.parseInt(request.getParameter("registerId"));
			dao.deleteSale(registerId);
			view = "saleList.trans";
			
		} else if(PATH.equals("/transList.trans")) {
			//거래 완료내역
	         request.setAttribute("transactions", dao.findTrans());
	         view = "/trans/transList.jsp";
		}else if(PATH.equals("/saleList.trans")) {
			//판매 전체 내역
	         request.setAttribute("saleList", dao.findSale());
	         view = "/trans/saleList.jsp";
	      }else if(PATH.equals("/saleAvailList.trans")) {
	    	  //판매중
	         request.setAttribute("saleList", dao.findSaleAvail());
	         view = "/trans/saleList.jsp";
	      }else if(PATH.equals("/saleSoldList.trans")) {
	    	  //판매완료
		         request.setAttribute("saleList", dao.findSaleSold());
		         view = "/trans/saleList.jsp";
		   }

		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}
