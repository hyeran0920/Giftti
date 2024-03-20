package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import dao.UserDAO;
import dto.UserDTO;


@WebServlet("*.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginDAO dao;

    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException{
    	super.init(config); //부모 클래스 초기화
    	 dao = new LoginDAO(); //데이터베이스와 상호작용 준비
    }
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String view = "";
		String ms ; //메시지
		
		//이미 로그인 함
		
		
		
		if(PATH.equals("/login.do")) {
			System.out.println("로그인 처리");
			
			String id = request.getParameter("userId");//문자열로 받아 옴.
			String password = request.getParameter("password");//문자열로 받아 옴.
	
			
			UserDAO userdao = new UserDAO();//db와 접속
			UserDTO user = userdao.find(id);//id를 USER DAO로 넘겨줘서 처리하게 할거임
			HttpSession session = request.getSession();

			if(user != null && user.getPassword().equals(password)) {
				
				 session.setAttribute("userid", id);
				//세션에 저장된 회원 정보 호출
				session.setMaxInactiveInterval(600); //세션 연결 기간600초
				
				System.out.println("비번은 맞음");
				
				//관리자면 관리자 페이지로 이동
				if(user.getId().equals("user1")) { //일단 관리자 아이디 user1
					view = "/giftiApp/index.jsp";
					System.out.println("관리자 로그인 처리");
				}
				// return "forward:/가야할곳"

				//일반 회원이 보일 페이지로 전환 주소 바꾸기
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
				///메인 페이지로 넘어가고 싶다면 getBoardList.do가 아니라 index.jsp로 넘기기.
				dispatcher.forward(request, response);
			}else {
				//로그인 실패시 다시 로그인 화면으로 이동
				RequestDispatcher dispatcher = request.getRequestDispatcher("/login/login.jsp");
				//RequestDispatcher dispatcher = request.getRequestDispatcher("/loginView.do");
				dispatcher.forward(request, response);
			}
		}else if(PATH.equals("/logout.do")) {
			//세션 삭제
			HttpSession session = request.getSession();
			session.invalidate();
			view = "/login/login.jsp";
		}
		
    }
}
