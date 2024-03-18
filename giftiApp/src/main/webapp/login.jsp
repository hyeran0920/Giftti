<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td{
	height: 40px;
	line-height: 40px;
}
.tdTitle{
	width: 200px;
	text-align: center;
	background-color: pink;
}
.tdContent{
	width: 400px;
	padding-left: 20px;
}
.tdContent>input{
	width: 350px;
	height: 30px;
	line-height: 30px;
}
.tdSubmit{
	text-align: center;
}
</style>
</head>
<body>
<%-- <%@ include file="../header.jsp" %> --%>
<h2>로그인 화면</h2>

<form action="login.do" method="post">
	<table border="1"> 
		<tr>
			<td class="tdTitle">아이디</td>
			<td class="tdContent"><input type="text" name="id" required="required" > </td>
		</tr>
		<tr>
			<td class='tdTitle'>비밀번호</td>
			<td class="tdContent"><input type="password" name="password" required="required" > </td>
		</tr>
		<tr>
			<td colspan="2" class="tdSubmit">
				<input type="submit" value="로그인" > 
			</td>
		</tr>

	
	</table>
	



</form>
<br>
<a href="register.jsp" ">회원 가입</a>
<hr>

</body>
</html>