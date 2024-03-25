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
    private CSDAO dao;//사용할 dao를 간단하게 출력하기 위한 변수 선언

    //servlet 초기화
    public CustomerServiceController() {
        super();//상속
        this.dao = new CSDAO();//데이터베이스와 상호작용 준비
    }
    
    private String FAQtotal(HttpServletRequest request,HttpServletResponse response) {
    	return "/customerservice/FAQ.jsp";
    }
    private String FAQcategory(HttpServletRequest request, HttpServletResponse restponse) {
    	return "/customerservice/FAQList.jsp";
    }
    private String FAQupdateView(HttpServletRequest request, HttpServletResponse response) {
    	return "/customerservice/FAQUpdate.jsp";
    }
    private String FAQupdate(HttpServletRequest request, HttpServletResponse response, String qcategory) {
    	return "findCategoryAll.customerservice?qcategory=" + qcategory;
    }
    
    
    
    

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String URI = request.getRequestURI();
        String PATH = URI.substring(URI.lastIndexOf("/"));
        String view = "";

        if (PATH.equals("/FAQ.customerservice")) {//이 주소로 들어 오면
            request.setAttribute("questions", dao.getAllQuestions());//dao 가져오기
            
            view = FAQtotal(request, response);//메소드 호출, jsp불러오면서 값도 같이 보내기
            
        } else if (PATH.equals("/findCategoryAll.customerservice")) {
            String qcategory = request.getParameter("qcategory");
            request.setAttribute("questions", dao.findByCategory(qcategory));
            request.setAttribute("category", qcategory);
            view = FAQcategory(request, response);
            
        } else if(PATH.equals("/FAQUpdateView.customerservice")) {
			
			int questionId = Integer.parseInt(request.getParameter("questionId"));
			request.setAttribute("faq", dao.findquestion(questionId));
		
			view = FAQupdateView(request, response);
			
        } else if (PATH.equals("/FAQUpdate.customerservice")) {
            CSDTO dto = new CSDTO();
            
            int questionId = Integer.parseInt(request.getParameter("questionId"));
            String qcategory = request.getParameter("qcategory");
            dto.setQuestionId(questionId);
            dto.setQcategory(qcategory);
            dto.setFaquestion(request.getParameter("faquestion"));
            dto.setAnswer(request.getParameter("answer"));

            dao.updateFAQ(dto);
            
            view = FAQupdate(request, response, qcategory);
            
        } else if (PATH.equals("/FAQInsertView.customerservice")) {
        	String category = request.getParameter("category");
        	request.setAttribute("category", category);
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