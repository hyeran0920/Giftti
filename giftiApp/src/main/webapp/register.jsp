<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
    <title>Login Page</title>
    <link href="/giftiApp/css/styles.css" rel="stylesheet" />
    <link href="/giftiApp/css/cust.css" rel="stylesheet" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 1. 우편번호 검색 버튼
    const zipbtn = document.querySelector("#zipbtn");
    
    // 버튼이 클릭되었을 때만 동작
    zipbtn.addEventListener('click', function() {
        // 다음 우편번호 서비스 API 호출
        new daum.Postcode({
            oncomplete: function(data) {
                // 우편번호 값을 입력할 input 태그에 값 설정
                document.userMember.zipcode.value = data.zonecode;
                
                // 주소 전체를 받기 위한 변수
                let fullAddress = '';
                
                // 추가 주소, 건물명/동명을 받을 변수
                let extendAddress = '';
                
                // 사용자가 선택한 주소 유형에 따라 주소 값 설정
                if (data.userSelectedType === 'R') { // 도로명 주소인 경우
                    fullAddress = data.roadAddress;
                } else { // 지번 주소인 경우
                    fullAddress = data.jibunAddress;
                }
                
                // 추가 주소 설정
                if (data.userSelectedType === 'R') { // 도로명 주소인 경우만 추가 주소 설정
                    if (data.bname !== '') {
                        extendAddress += data.bname; // 법정동/법정리 이름
                    }
                    if (data.buildingName !== '') {
                        extendAddress += (extendAddress !== '' ? ', ' + data.buildingName : data.buildingName); // 건물명
                    }
                    // 기본 주소에 추가 주소를 추가
                    fullAddress += (extendAddress !== '' ? ' (' + extendAddress + ')' : '');
                }
                
                // 폼에 주소 값 설정
                document.userMember.address1.value = fullAddress;
                
                // 주소 입력 필드로 포커스 이동
                document.userMember.address2.focus();
            }
        }).open();
    });
});

function passwordCheckFunction(){

	let password1 =$('#password1').val(); //value 값
	let password2 =$('#password2').val(); //value 값
	if(password1 !== password2){
		$("#passwordText").text("비밀번호가 일치하지 않습니다.").css("color", "red");
	}else{
		$("#passwordText").text('')
	//	$("#password2").attr("disabled",true); //비활성화(true) , 활성화(false)
	//	$("#password2").prop("disabled",true); //읽기 전용(true) , 활성화(false)
	}
	
}

//아이디 중복체크
function registerFunction(){
	let id =$('#id').val();

	$.ajax({
		type : 'POST', //전달 방식,경로 ,데이터를 넣어 줘야함
		url : 'idCheck.do', //url
		data : {user_id:id}, //{변수명 : 변수값}
		success : function(result){
			
			 if(result =='1') {
        $('#idText').text("사용할 수 있는 아이디입니다.").css("color", "blue");
    } else {
        $('#idText').text("사용할 수 없는 아이디입니다.").css("color", "red");
    }
		}
	});
}
</script>


</head>
<body class="bg-primary bg-light">
   <div id="layoutAuthentication">
       <div id="layoutAuthentication_content">
           <main>
              <div class="container">
                <div class="row justify-content-center">
                   <div class="col-lg-7">
                      <div class="card shadow-lg border-0 rounded-lg mt-5">
                         <div class="card-header">
                            <img src="https://raw.githubusercontent.com/hyeran0920/JavaMiniProject/6bd667da7303be9f5261011b36510bf8e1d48347/KakaoTalk_20240310_232608243.png" style="width: 100px;" class="logo rounded mx-auto d-block" >                                      
                                <h3 class="text-center font-weight-light my-4">회원 가입</h3></div>
                                    <div class="card-body">
                                       <form action="membership.do" method="post" name="userMember" > 
                                         <div class="row mb-3">
                                            <div class="col-md-8">
                                               <div class="form-floating mb-3 ">
                                                  <input class="form-control" id="id" name="user_id" type="text" placeholder="ID를 입력해주세요" />                                            
                                                        <label for="id"> ID</label>
                                                        <span id="idText"></span>                                              
                                                    </div> 
                                                    </div>
                                                     <div class="col-md-4">
                                                         <button type="button" class="btn" id="overlapCheck" onclick="registerFunction()">중복체크</button>
			                                                </div>
                                               
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 ">
                                                        <input class="form-control" id="password1" type="password" name="password1" placeholder="Create a password" />
                                                        <label for="password1"> 비밀번호</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 ">
                                                        <input class="form-control" id="password2" type="password" name="password2" onkeyup="passwordCheckFunction()" required="required" placeholder="Confirm password" />
                                                        <label for="password2"> 비밀번호 확인</label>
                                                    </div>
                                                </div>
                                                <br><span id="passwordText"></span>
                                              	<div class="col-md-6">
                                                    <div class="form-floating mb-3" >
                                                        <input class="form-control" id="inputFirstName" name="name" type="text" placeholder="이름을 입력해주세요" />
                                                        <label for="inputFirstName">이름</label>
                                                    </div>     
                                                   </div>                                         
                                   			<div class="col-md-10">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" type="email" name="email"  placeholder="name@example.com" />
                                                <label for="inputEmail"> 이메일 </label>
                                            </div>
<<<<<<< HEAD
                                            
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputphone" type="text" name="phone" placeholder="연락처를 번호로만 입력해주세요" />
                                                <label for="inputphone">연락처</label>
=======
>>>>>>> refs/heads/develop
                                            </div>
                                            <div class="col-md-8">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputphone" type="text" name="phone" placeholder="연락처를 번호로만 입력해주세요" />
                                                <label for="inputphone"> 연락처 (숫자만 입력)</label>
                                            </div>
                                            </div>
                                            <div class="col-md-6">
                                            <div class="form-floating mb-3">
                                          
                                                <label for="age">나이</label>
                                                <select class="form-control" id="number" name="age" placeholder="나이" >
									            <% for (int i = 1; i <= 100; i++) { %>
									                <option class="text-end fs-1" value="<%= i %>"><%= i %></option>
									            <% } %>
									        	</select>
                                            </div>
                                            </div>
                                            <div class="col-md-4 checks mt-2">
                                                             
								                		<input type="radio" id="gender1" name="gender" value="남">
													    <label for="gender1">남자 </label>
													    <input type="radio" id="gender2" name="gender" value="여">
													    <label for="gender2">여자 </label>
                                       
                                            </div>

                                             <div class="col-md-8">
                                            <div class="form-floating mb-3 ">                     
                                                <input class="form-control" id="post" type="text" class="zipcode" name="zipcode" placeholder="우편번호를 검색해주세요" readonly="readonly"/>
                                                <label for="post"> 우편번호</label>
                                            </div>                                       
                                            </div>
                                             <div class="col-md-4 ">                                       
                                                <button type="button" class="btn " id="zipbtn"> 우편번호</button>
                                            </div>
                                            
                                         	<div class="col-md-10">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputAddress1" name="address1" type="text" placeholder="주소를 입력해주세요" />
                                                <label for="inputAddress1">주소</label>
                                            </div>
                                            </div>
                                            <div class="col-md-10">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputAddress2" name="address2" type="text" placeholder="상세주소를 입력해주세요" />
                                                <label for="inputAddress2"> 상세주소</label>
                                            </div>
                                            </div>
                                        
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><input type="submit" class="btn btn-primary btn-secondary btn-block" id="joinUp"value="회원 등록"></div>
                                            </div>
                                   </div> 
                                        </form>
                                        <%
									        String messageType = (String) request.getSession().getAttribute("messageType");
									        String messageContent = (String) request.getSession().getAttribute("messageContent");
									        
									        // messageType이 성공 메시지인 경우에만 알림창을 띄움
									        if ("성공 메시지".equals(messageType)) {
									    %>
								            <script>
								                alert("<%= messageContent %>");
								                $('#joinUp').alert()
								            </script>
											    <%
											        }
											    %>
											    <%
											        // 알림창을 띄운 후, 세션에 저장된 메시지는 삭제하여 중복 출력을 방지
											        request.getSession().removeAttribute("messageType");
											        request.getSession().removeAttribute("messageContent");
											    %>
                                       
                                    </div>
                             <div class="card-footer text-center py-3">
                       <div class="small"><a href="login.jsp">계정이 있으신가요? 로그인하기</a></div>
                   </div>
               </div>
            </div>
         </div>
      </div>
   </main>
</div>

</body>
</html>

