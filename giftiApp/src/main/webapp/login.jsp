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
    <title>로그인</title>
    <link rel="icon" type="images/png" href="/giftiApp/images/pavicon.png">

    <link href="/giftiApp/css/login2.scss" rel="stylesheet" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body>
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

  <div class="login">
    <div class="login__content">
   
      <div class="login__forms">
<!--         login form -->
        <form action="login.do" class="login__register" id="login-in" method="post">
         
          <img alt="로고" src="/giftiApp/images/Logo_font.png" style="height: 250px">
          <div class="login__box">
            <i class='bx bx-user login__icon'></i>
            <input type="text" placeholder="아이디" id ="userId" name="userId" class="login__input">
          </div>
          <div class="login__box">
            <i class='bx bx-lock login__icon'></i>
            <input type="password" placeholder="비밀번호" id ="password" name="password" class="login__input">
          </div>
          <a href="#" class="login__forgot">비밀번호 찾기</a>
          
         <button type="submit" class="login__button">로그인</button>
          <div>
            <span class="login__account login__account--account"></span>
            <a href="register.jsp"><span class="login__signin" id="sign-up">회원 가입</span></a>
          </div>
          
        </form>

      </div>
    </div>
   </div>

</body>
</html>

