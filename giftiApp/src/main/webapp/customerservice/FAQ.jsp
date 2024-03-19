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
<title>고객 지원</title>
<link rel="icon" type="images/png" href="/giftiApp/images/pavicon.png">
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
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
						<span class="text-primary">고객지원 </span>> FAQ
					</h3>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">자주 묻는 질문</li>
					</ol>
				</div>
				<div class="accordion" id="accordionExample">
  					<div class="accordion-item">
  						<c:forEach var="question" items="${questions }">
    					<h2 class="accordion-header" id="headingOne">
      						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${question.questionId }" aria-expanded="false" aria-controls="collapseOne">
        						${question.faquestion } 
      						</button>
    					</h2>
    					<div id="collapseda${question.questionId  }" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      						<div class="accordion-body">
        						<strong>[ ${question.qcategory } ]</strong>
        					 	${question.answer } 
      						</div>
    					</div>
    					</c:forEach>
  					</div>
  				</div>
			</main>
			<jsp:include page="../footer.jsp" />
		</div>




	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>

</html>