package dao;


import dto.UserDTO;

public class user {
	
	public static void main(String[] args) {
		UserDAO dao = new UserDAO();
//        List<UserDTO> userList = dao.findAll();
//        
//        for (UserDTO user : userList) {
//            System.out.println("User ID: " + user.getUser_id());
//            System.out.println("Name: " + user.getName());
//            System.out.println("Nickname: " + user.getNickname());
//            // 나머지 필드도 출력 가능
//            System.out.println("---------------------------------");
//        }	

		        // 특정 사용자의 ID를 지정합니다.
		        String userId = "user1";

		        // UserController에서 사용자 정보를 찾는 메서드 호출
		        UserDTO user = dao.find(userId);

		        // 사용자 정보가 존재하는 경우 콘솔에 출력
		        if (user != null) {
		            System.out.println("User ID: " + user.getId());
		            System.out.println("Name: " + user.getName());
		            System.out.println("Nickname: " + user.getNickname());
		            System.out.println("Gender: " + user.getGender());
		            System.out.println("Phone: " + user.getPhone());
		            System.out.println("Age: " + user.getAge());
		            System.out.println("Address: " + user.getAddress());
		            System.out.println("Status: " + user.getStatus());
		        } else {
		            System.out.println("해당 사용자를 찾을 수 없습니다.");
		        }
		    }


}
