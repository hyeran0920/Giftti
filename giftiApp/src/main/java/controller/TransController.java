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
			view = allList(request, response);
	            
	      } else if(PATH.equals("/sellInfo.trans")) {
			view = info(request, response);
			
		} else if(PATH.equals("/productSaleList.trans")) {
			view = productSaleList(request, response);
			
		} else if(PATH.equals("/saleDelete.trans")){
			view = productSaleDelete(request, response);
			
		}else if(PATH.equals("/saleDeleteList.trans")){
			view = delete(request, response);
			
		} else if(PATH.equals("/transList.trans")) {
			//거래 완료내역
	        view = transList(request, response);
		}else if(PATH.equals("/saleList.trans")) {
			//판매 전체 내역
			view = saleList(request, response);
	         
	    }else if(PATH.equals("/saleAvailList.trans")) {
	    	 //판매중
	    	view = saleAvailList(request, response);
	         
	    }else if(PATH.equals("/saleSoldList.trans")) {
	    	  //판매완료
	    	view = saleSoldList(request, response);
		         
		 }

		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
	
	private String allList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("transactions", dao.findTransFive());
        request.setAttribute("saleList", dao.findSaleAvailFive());
        return "/trans/transSaleList.jsp";
	}
	
	private String transList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("transactions", dao.findTrans());
        return "/trans/transList.jsp";
	}
	
	private String saleList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("saleList", dao.findSale());
        return "/trans/saleList.jsp";
	}
	
	private String saleAvailList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("saleList", dao.findSaleAvail());
        return "/trans/saleList.jsp";
	}
	
	private String saleSoldList(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("saleList", dao.findSaleSold());
	    return "/trans/saleList.jsp";
	}
	
	
	private String info(HttpServletRequest request, HttpServletResponse response) {
		int registerId = Integer.parseInt(request.getParameter("registerId"));
		request.setAttribute("saleItem", dao.findSaleInfo(registerId));
		return "/product/saleProductInfo.jsp";
	}
	
	private String productSaleList(HttpServletRequest request, HttpServletResponse response) {
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		request.setAttribute("saleItems", dao.findSaleItem(itemId));
		return "/product/productSaleList.jsp";
	}
	
	private String productSaleDelete(HttpServletRequest request, HttpServletResponse response) {
		int registerId = Integer.parseInt(request.getParameter("registerId"));
		int itemId = dao.getItemId(registerId);
		dao.deleteSale(registerId);
		return "productSaleList.trans?itemId=" + itemId;
	}
	
	private String delete(HttpServletRequest request, HttpServletResponse response) {
		int registerId = Integer.parseInt(request.getParameter("registerId"));
		dao.deleteSale(registerId);
		return "saleList.trans";
	}
}
