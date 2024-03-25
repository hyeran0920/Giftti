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
							 <style>
							    	li.category{
							    		margin : 0 3px;
							    	}
							    	li.category:hover{
							    		background-color: #ccc;
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
				<hr class="mb-40">
				
				
				
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					    <div class="container-fluid">
					            <ul class="navbar-nav">
					                <li class="nav-item category">
					                    <a class="nav-link" href="FAQ.customerservice">전체</a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategoryAll.customerservice?qcategory=서비스안내">
					                        서비스 안내
					                    </a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategoryAll.customerservice?qcategory=상품관련">
					                        상품 관련
					                    </a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategoryAll.customerservice?qcategory=서비스이용">
					                        서비스 이용
					                    </a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategoryAll.customerservice?qcategory=결제관련">
					                        결제 관련
					                    </a>
					                </li>
					             
					            </ul>
					            <button type="submit" class="btn btn-secondary btn-sm"
								id="btn_update"
								onclick="location.href='FAQInsertView.customerservice?category=${category}'"><i class="fa-solid fa-plus"></i> FAQ 등록</button>
						
					    </div>
					</nav>
				
				
				
				
				<div class="accordion" id="accordionExample">
				    <div class="accordion-item">
				        <c:forEach var="question" items="${questions}">
		
				            <h2 class="accordion-header" id="heading${question.questionId}">
				                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${question.questionId}" aria-expanded="false" aria-controls="collapse${question.questionId}">
				                 <%--    <strong>[ ${question.qcategory} ]</strong> &nbsp; 카테고리 내용이 나오지 않길래 그냥 주석처리 했습니다..--%>
				                     ${question.faquestion} 
				                     
				                </button>
				            </h2>
				            <div id="collapse${question.questionId}" class="accordion-collapse collapse" aria-labelledby="heading${question.questionId}" data-bs-parent="#accordionExample">
				                <div class="accordion-body">
				                
				                
				                    ${question.answer} 
				                    		         <div class="box-footer">
                                            <button type="submit" class="btn btn-primary btn-sm"
                                                id="btn_update" onclick="location.href='FAQUpdateView.customerservice?questionId=${question.questionId}'"><i class="fa-solid fa-pen"></i> 수정</button>
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                id="btn_delete" onclick="location.href='FAQDelete.customerservice?questionId=${question.questionId}'"><i class="fa-solid fa-trash"></i> 삭제</button>
                                        </div>
				                    
				                    
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