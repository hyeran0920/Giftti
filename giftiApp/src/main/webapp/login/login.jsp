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

</head>

<body>

<div class="wrapper">
  <div class="container">
    <div class="sign-up-container overlay-container">
      <form>
        <h1>Create Account</h1>
        <div class="social-links">
          
        </div>
        <input type="text"  name="user_id" placeholder="ID">
        <input type="text"  name="name" placeholder="이름">
        <input type="password"  name="password1" placeholder="Password">
        <input type="password" name="password2" placeholder="Password 확인">
        <input type="email" placeholder="Email">
		<input type="text"  name="phone" placeholder="전화 번호">
         <input type="radio" name="gender" value="male"> Male
        <input type="radio" name="gender" value="female"> Female<br>
        <input type="text"  name="address" placeholder="주 소">
        <input type="text"  name="nickname" placeholder="닉 네 임">
        <input type="submit" class="form_btn" ><a href ="register.do">회원 가입 신청</a>
      </form>
    </div>
    <div class="sign-in-container overlay-container">
      <form  action="login.do" method="post"  >
        <h1>Sign In</h1>
        <div class="social-links">
          <div>
            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
          </div>
          <div>
            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
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

