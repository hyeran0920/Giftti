package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CSDAO;
import dto.CSDTO;



@WebServlet("*.customerservice")
public class CustomerServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CSDAO dao;

    public CustomerServiceController() {
        super();
        this.dao = new CSDAO(); // 이 부분에서 dao 객체를 생성
    }



	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String view = "";


		if(PATH.equals("/FAQ.customerservice")) {

			request.setAttribute("questions", dao.allQuestion());
			
			

			view = "/customerservice/FAQ.jsp";

		}else if(PATH.equals("/findCategoryAll.customerservice")) {
	         
	         String qcategory = request.getParameter("qcategory");
	         request.setAttribute("questions", dao.findByqcategory(qcategory));
	         
	         view = "/customerservice/FAQList.jsp";
	         
		  }else if(PATH.equals("/FAQList.customerservice")) {
				
				CSDTO dto = new CSDTO();
				String faquestion = request.getParameter("faquestion");
				
				dto.setQcategory(request.getParameter("qcategory"));
				dto.setFaquestion(request.getParameter("faquestion"));
				dto.setAnswer(request.getParameter("answer"));
				
				
				dao.updateFAQ(dto);
//				FAQUpdateView.customerservice?faquestion=${question.faquestion}
				view = "FAQUpdateView.customerservice?faquestion=" + faquestion;
				
			} else if(PATH.equals("/FAQInsert.customerservice")) {
				
				
				CSDTO dto = new CSDTO();
				
				dto.setQcategory(request.getParameter("qcategory"));
				dto.setFaquestion(request.getParameter("faquestion"));
				dto.setAnswer(request.getParameter("answer"));
				
				
				dao.insertFAQ(dto);
				
				view = "FAQInsert.customerservice";
				
			} else if(PATH.equals("/FAQDelete.customerservice")) {
				
				int questionId = Integer.parseInt(request.getParameter("q_id"));
				dao.deleteFAQ(questionId);
				
				view = "FAQList.customerservice";
				
			} 
		




		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);

	}

}