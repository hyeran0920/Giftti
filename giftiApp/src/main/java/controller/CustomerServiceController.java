package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.CSDAO;
import dto.CSDTO;



@WebServlet("*.customerservice")
public class CustomerServiceController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CSDAO dao;

    public CustomerServiceController() {
        super();
        this.dao = new CSDAO();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String URI = request.getRequestURI();
        String PATH = URI.substring(URI.lastIndexOf("/"));
        String view = "";

        if (PATH.equals("/FAQ.customerservice")) {
            request.setAttribute("questions", dao.getAllQuestions());
            
            view = "/customerservice/FAQ.jsp";
            
        } else if (PATH.equals("/findCategoryAll.customerservice")) {
            String qcategory = request.getParameter("qcategory");
            request.setAttribute("questions", dao.findByCategory(qcategory));
            
            view = "/customerservice/FAQList.jsp";
            
        } else if(PATH.equals("/FAQUpdateView.customerservice")) {
			
			int questionId = Integer.parseInt(request.getParameter("questionId"));
			request.setAttribute("faq", dao.findquestion(questionId));
		
			view = "/customerservice/FAQUpdate.jsp";
			
        } else if (PATH.equals("/FAQUpdate.customerservice")) {
            CSDTO dto = new CSDTO();
            
            int questionId = Integer.parseInt(request.getParameter("questionId"));

            dto.setQuestionId(questionId);
            dto.setQcategory(request.getParameter("qcategory"));
            dto.setFaquestion(request.getParameter("faquestion"));
            dto.setAnswer(request.getParameter("answer"));

            dao.updateFAQ(dto);
            
            view = "FAQUpdateView.customerservice?questionId=" + questionId;
            
        } else if (PATH.equals("/FAQInsertView.customerservice")) {
        	
            view = "/customerservice/FAQInsert.jsp";
            
        }else if (PATH.equals("/FAQInsert.customerservice")) {
            CSDTO dto = new CSDTO();

            dto.setQcategory(request.getParameter("qcategory"));
            dto.setFaquestion(request.getParameter("faquestion"));
            dto.setAnswer(request.getParameter("answer"));

            dao.insertFAQ(dto);
            
            view = "FAQ.customerservice";
            
        } else if (PATH.equals("/FAQDelete.customerservice")) {
            int questionId = Integer.parseInt(request.getParameter("questionId"));
            dao.deleteFAQ(questionId);
            view = "FAQ.customerservice";
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(view);
        dispatcher.forward(request, response);
    }
}