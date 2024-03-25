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
<title>유저 조회</title>
<link rel="icon" type="images/png" href="/giftiApp/images/pavicon.png">
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="/giftiApp/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: "Noto Sans KR", sans-serif;
}

th, td {
	font-size: 1rem;
}

a {
	text-decoration: none;
}
</style>
</head>

<body class="sb-nav-fixed">
	<jsp:include page="../topNav.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="../sidebar.jsp" />
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h3 class="mt-4">
						<span class="text-primary">회원관리 </span>> 유저조회
					</h3>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">유저 관리 화면</li>
					</ol>
				</div>
				<hr class="mb-40">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 유저 전체 조회
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>회원 ID</th>
									<th>이름</th>
									<th>닉네임</th>
									<th>성별</th>
									<th>핸드폰</th>
									<th>나이</th>
									<th>지역</th>
									<th>상태</th>
									<th>판매상품</th>
								</tr>
								<!-- <tr>
									<th>번호</th>
									<th>회원 ID</th>
									<th>이름</th>
									<th>닉네임</th>
									<th>성별</th>
									<th>핸드폰</th>
									<th>나이</th>
									<th>지역</th>
									<th>상태</th>
									                                    <th>판매상품 개수</th>
                                    <th>총 거래 수</th>
								</tr> -->
							</thead>
							<tfoot>
								<tr>
									<!-- <th>번호</th> -->
									<th>회원 ID</th>
									<th>이름</th>
									<th>닉네임</th>
									<th>성별</th>
									<th>핸드폰</th>
									<th>나이</th>
									<th>지역</th>
									<th>상태</th>
									<!--                                     <th>판매상품 개수</th>
                                    <th>총 거래 수</th> -->
								</tr>
							</tfoot>
							<tbody>

								<c:forEach var="user" items="${user}">
									<tr>
										<td><a href="userInfo.user?userId=${user.userId}">${user.userId}</a></td>
										<td>${user.name}</td>
										<td>${user.nickname}</td>
										<td>${user.gender}</td>
										<td>${user.phone}</td>
										<td>${user.age}</td>
										<td>${user.address}</td>
										<td>
										<c:choose>
										<c:when test="${user.status eq 'ing' }">활동</c:when>
										<c:otherwise>정지</c:otherwise>
										</c:choose>
										</td>
							      		<td><a href="userTrans.user?userId=${user.userId}">${user.count}</a></td>
										
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</div>
			</main>
			<jsp:include page="../footer.jsp" />

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/giftiApp/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="/giftiApp/js/datatables-simple-demo.js"></script>
</body>

</html>