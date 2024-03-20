package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.ProductDTO;
import dto.UserDTO;

@WebServlet("*.user")
public class UserController extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    UserDAO dao; //사용할 dao를 간단하게 출력하기 위해 변수 선언
    
    //servlet 초기화
    public UserController() {
    	super(); //생성자 아마
    }
    public void init(ServletConfig config) throws ServletException{
    	super.init(config); //부모 클래스 초기화
    	dao = new UserDAO(); //데이터베이스와 상호작용 준비
    }
    
    
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		
    	String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String view = "";
		System.out.println(PATH);
		
		if(PATH.equals("/userList.user")) {
			System.out.println("회원 리스트");
			request.setAttribute("user",dao.findAll());
			view = "/user/userList.jsp";
			
		}else if(PATH.equals("/userTrans.user")) {
			System.out.println("회원 판매 상품");
			
			String userId = request.getParameter("userId");
			request.setAttribute("user",dao.find2(userId));
			view = "/user/userTrans.jsp";
			
		}else if(PATH.equals("/userInfo.user")) {
			System.out.println("회원 정보");
			
			String userId = request.getParameter("userId");
			request.setAttribute("user",dao.find(userId));
			request.setAttribute("userTrans",dao.find2(userId));
			view = "/user/userInfo.jsp";
						
		}else if(PATH.equals("/userUpdate.user")) {
			System.out.println("회원 수정");
			
			UserDTO dto = new UserDTO();
			String userId = request.getParameter("userId");
			dto.setStatus(request.getParameter("status"));
			
			dao.Update(dto);
		    view = "/user/userUpdate.jsp";

		} 

		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
    }
    
 
}
