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
	String view = "";

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
		
		int result =0;
		
		//이미 로그인 함
		if(PATH.equals("/idCheck.do")) {
			System.out.println("아이디 중복 검색");
			String id = request.getParameter("user_id");//문자열로 받아 옴.
			result =dao.registerCheck(id);
			System.out.println(result);
			response.getWriter().write(result+"");
			
		} 
		else {
				

			if(PATH.equals("/login.do")) {
				view=login( request,  response);

			}else if(PATH.equals("/logout.do")) {
				//세션 삭제
				view=logout( request,  response);
				
			
			}else if(PATH.equals("/membership.do")) {
				view=membership( request,  response);
								  
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}
	private String membership(HttpServletRequest request, HttpServletResponse response) {
		//먼저 한글 필터 처리 부터 하기
		int result;
		String id = request.getParameter("user_id");
		String name = request.getParameter("name");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("zipcode") + " " +request.getParameter("address1") + " " + request.getParameter("address2") ;
		String nickname = request.getParameter("nickname");
		 System.out.println(id+name+password1+password2+email+phone);
		
		if(id==null || id.equals("")||password1==null || password1.equals("")||
				password2==null || password2.equals("")||name==null || name.equals("")||	
				phone==null || phone.equals("")||email==null || email.equals("") ) {
			request.getSession().setAttribute("messageType","오류 메시지");
			request.getSession().setAttribute("messageContent", "필수 입력란은 모두 입력해주세요.");
			view="/login.do";	
			//response.sendRedirect("login.jsp");
		
			
			return view;
		}if(!password1.equals(password2)) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "비밀번호가 일치하지 않습니다.");
			view="/login.do";		
		
			return view;
		}
		
		UserDTO dto =new UserDTO();	
		System.out.println(gender);
		dto.setUserId(id);
		dto.setPassword(password1);
		dto.setName(name);
		dto.setAddress(address);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setAge(age);
		dto.setNickname(nickname);
		dto.setGender(gender);
		 
		result = dao.insertUser(dto);
		
		if(result == 1) {
			request.getSession().setAttribute("messageType","성공 메세지");
			request.getSession().setAttribute("messageContent", (name)+"님 환영 합니다.");
			 
			view = "/login.jsp";							
		}else {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
			view = "/login.jsp";
	}
		return view;
	}
	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		view = "/login.jsp";
		return view;
	}
	private String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("userId");//문자열로 받아 옴.
		String password = request.getParameter("password");//문자열로 받아 옴.

		
		UserDAO userdao = new UserDAO();//db와 접속
		UserDTO user = userdao.find(id);//id를 USER DAO로 넘겨줘서 처리하게 할거임
		HttpSession session = request.getSession();

		if(user != null && user.getPassword().equals(password)) {
			
			 session.setAttribute("userId", id);
			//세션에 저장된 회원 정보 호출
			session.setMaxInactiveInterval(600); //세션 연결 기간600초		
			System.out.println("비번은 맞음");
			   view = "/index.jsp";// 회원 페이지로 이동
			//관리자면 관리자 페이지로 이동
			if(user.getUserId().equals("user1")) { //일단 관리자 아이디 user1
				view = "/index.jsp";
				System.out.println("관리자 로그인 처리");
			}
	
		}else {
			view ="/login2.jsp";
			
		}
		return view;
	}
}
    	
