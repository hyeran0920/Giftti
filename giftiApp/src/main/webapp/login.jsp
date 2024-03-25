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

    <link href="/giftiApp/css/login.css" rel="stylesheet" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
//아이디 중복 검사
function passwordCheckFunction(){

	let password1 =$('#password1').val(); //value 값
	let password2 =$('#password2').val(); //value 값
	if(password1 !== password2){
		$("#passwordText").text("비밀번호가 일치하지 않습니다.")
	}else{
		$("#passwordText").text('')
		$("#password2").attr("disabled",true); //비활성화(true) , 활성화(false)
		$("#password2").prop("disabled",true); //읽기 전용(true) , 활성화(false)
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
			
			if(result == 1){
				$('#idText').text("사용할 수 있는 아이디입니다.")
			}else{
				$('#idText').text("사용할 수 없는 아이디입니다.")
			}
		}
	});
}
</script>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
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
</script>

</head>

<body>

<div class="wrapper">
  <div class="container">
    <div class="sign-up-container overlay-container" >
        <div style="overflow-y: scroll ; height: 720px;">  	
 	<div style="height: 100px;"></div>
        <form action="membership.do" method="post" name="userMember" > 
        <!-- 회원가입 양식 -->
        <table border="1">
            <caption>회원가입 양식</caption> 
                    
            <tr>
                <th class="tTitle"><label for="id">아이디</label></th>
                <td class="tCont"><input type="text" class="user_id" name="user_id" id="id"  required="required">
                            <button type="button" class="btn" id="overlapCheck" onclick="registerFunction()">중복체크</button>
                        <br><span id="idText" style="color:red;"></span>                              
                </td>
            </tr>
            <tr>
                <th class="tTitle"><label for="password1">비밀번호</label></th>
                <td class="tCont"><input type="password" class="input1" name="password1" id="password1"  required="required">                
                </td>
            
            </tr>
            <tr>
                <th class="tTitle"><label for="password2">비밀번호 확인</label></th>
                <td class="tCont"><input type="password" class="input1" name="password2" id="password2" onkeyup="passwordCheckFunction()" required="required">
                <br><span id="passwordText" style="color:red;"></span>
                </td>
            
            </tr>
            <tr>
                <th class="tTitle"><label for="name">이 름</label></th>
                <td class="tCont"><input type="text" class="input1" name="name" id="name" required="required"></td>
            </tr>
            <tr>
                <th class="tTitle"><label for="email">E-mail</label></th>
                <td class="tCont"><input type="text" class="input1" name="email" id="email"></td>
            </tr>
            
            <tr >
                <th class="tTitle"><label for="phone">휴대폰번호</label></th>
              	<td  class="tCont"><input type="text" class="input1 iphone" name="phone" id="phone" required="required">  
                </td>
            </tr>
            <tr>
                <th class="tTitle"><label for="gender">성별</label></th>
                <th class="tgender"><input type="radio" class="gender"  name="gender" value="남">남
                <input type="radio" class="gender" name="gender" value="여">여
                </th>
            </tr>
             <tr>
                <th class="tTitle"><label for="age">나이</label></th>
                <td class="tCont"><input type="text" class="input1" name="age" id="age"></td>
            </tr>
            <tr>
                <th class="tTitle"><label for="post">우편번호</label></th>
                <td class="tCont"><input type="text" class="zipcode" name="zipcode" id="post">
                 <button type="button" class="btn" id="zipbtn">우편번호</button></td>
            </tr>           
      
            <tr>
                <th class="tTitle"><label for="address1">주소</label></th>
                <td class="tCont"><input type="text" class="input1 iaddress" name="address1" id="address1" readonly="readonly"></td>
            </tr>
            <tr>
                <th class="tTitle"><label for="address2">상세주소</label></th>
                <td class="tCont"><input type="text" class="input1 iaddress" name="address2" id="address2"></td>
            </tr>
            <tr>
                <th class="tTitle"><label for="nickname">닉네임</label></th>
                <td class="tCont"><input type="text" class="input1" name="nickname" id="nickname"></td>
            </tr>
            

        </table>
           <input type="submit" class="btn" value="가입하기">

    </form>

        </div>
    </div>
    
    <div class="sign-in-container overlay-container">
      <form  action="login.do" method="post"  >
        <h1><a href="index.jsp">여기를 클릭하면 index 페이지이동 로그인세션 체크</a></h1>
        <div class="social-links">
          <div>
            <a href="https://www.facebook.com/"><i class="fa fa-facebook" aria-hidden="true"></i></a>
          </div>
          <div>
            <a href="https://twitter.com/"><i class="fa fa-twitter" aria-hidden="true"></i></a>
          </div>
          <div>
            <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
          </div>
        </div>
        <span>or use your account</span>
        <input type="text" id ="userId" name="userId" placeholder="ID">
        <input type="password"  id ="password" name="password" placeholder="Password">
         <button type="submit" class="form_btn" >접 속 하 기</button>
      </form>
    </div>
    <div class="overlay-container">
      <div class="overlay-left">
        <h1>Welcome 기쁘띠</h1>
        <p>To keep connected with us please login with your personal info</p>
        <button id="signIn" class="overlay_btn">로 그 인</button>
      </div>
      <div class="overlay-right">
        <h1>Hello, 기쁘띠</h1>
        <p>Enter your personal details and start journey with us</p>
        <button id="signUp" class="overlay_btn">회원 가입</button>
      </div>
    </div>
  </div>
</div>

<script>
const signUpBtn = document.getElementById("signUp");
const signInBtn = document.getElementById("signIn");
const container = document.querySelector(".container");

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});
</script>



</body>
</html>

