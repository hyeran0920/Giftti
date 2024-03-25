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
    
    
    private String userList(HttpServletRequest request, HttpServletResponse response) {
        return "/user/userList.jsp";//이동할 jsp 경로
    }
    private String userTrans(HttpServletRequest request, HttpServletResponse response) {
    	return "/user/userTrans.jsp";
    }
    private String userInfo(HttpServletRequest request, HttpServletResponse response) {
    	return "/user/userInfo.jsp";
    }
    private String userUpdateView(HttpServletRequest request, HttpServletResponse response) {
    	return "/user/userUpdate.jsp";
    }
    private String userUpdate(HttpServletRequest request, HttpServletResponse response, String userId) {
    	return "userInfo.user?userId=" + userId;
    }
    

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		
    	String URI = request.getRequestURI();
		String PATH = URI.substring(URI.lastIndexOf("/"));
		String view = "";
		
		if(PATH.equals("/userList.user")) {//이 주소로 들어오면
			request.setAttribute("user",dao.findAll());//dao가져오기
			view = userList(request, response);//메소드로 가서 jsp를 불러오면서 값도 같이 보내기
			
		}else if(PATH.equals("/userTrans.user")) {
			
			String userId = request.getParameter("userId");
			request.setAttribute("user1",dao.find(userId));
			request.setAttribute("user",dao.find2(userId));
			view = userTrans(request, response);
			
		}else if(PATH.equals("/userInfo.user")) {
			
			String userId = request.getParameter("userId");
			request.setAttribute("user",dao.find(userId));
			request.setAttribute("userTrans",dao.find2(userId));
			view = userInfo(request, response);
						
		}else if(PATH.equals("/userUpdateView.user")) {
		    
		    String userId = request.getParameter("userId");
		    request.setAttribute("user", dao.find(userId));
		    request.setAttribute("allStatus", dao.findAllStatus()); // 사용자 상태 값 전달
		    
		    view = userUpdateView(request, response);
		}else if (PATH.equals("/userUpdate.user")) {

		    String userId = request.getParameter("userId");
		    String status = request.getParameter("status"); // 사용자가 선택한 상태 값

		    UserDTO dto = new UserDTO();
		    dto.setUserId(userId);
		    dto.setStatus(status);

		    dao.updateStatus(dto); // 상태 값 업데이트 메서드 호출

		    view = userUpdate(request, response,userId);
		}


		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
    }
    
 
}
