package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CSDAO;



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
			System.out.println("FAQ 리스트");
		try {
			request.setAttribute("questions", dao.AllQuestion());
		}catch(Exception e) {
			e.printStackTrace();
		}
			view = "/customerservice/FAQ.jsp";
				
		}

		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}

}
