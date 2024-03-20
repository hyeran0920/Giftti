<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>유저 조회</title>
    <link rel="icon" type="images/png" href="/giftiApp/images/pavicon.png">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: "Noto Sans KR", sans-serif;
        }
		.center-table {
        margin: auto; /* 좌우 가운데 정렬 */
    	}
        th, td{
            font-size: 1rem;
            padding: 5px 10px;
        }
        a{
        	text-decoration: none;
        }
    </style>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../topNav.jsp"/>
    <div id="layoutSidenav">
        <jsp:include page="../sidebar.jsp"/>
 
		<!-- 여기부터 인포 내용 -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h3 class="mt-4">
						<span class="text-primary">회원관리 </span>> 유저 상세 조회
					</h3>
					<ol class="breadcrumb mb-4">
					<li> 등록한 상품 목록</li>
					</ol>
				</div>
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;$ {userId} 님의 등록 내역</h3>
				<br><br>
				<table class="table-bordered center-table" id="saleList">
					<tr>
						<th>판매자</th>
						<th>거래번호</th>
						<th>카테고리</th>
						<th>상품명</th>
						<th>정가</th>
						<th>판매가격</th>
						<th>등록일</th>
						<th>판매상태</th>
					</tr>
					<c:forEach var="transaction" items="${user}">
					    <tr>
					        <th>${transaction.user_id}</th>
					        <td>${transaction.registerId}</td>
					        <td>${transaction.category}</td>
					        <td>${transaction.itemName}</td>
					        <td>${transaction.price}</td>
					        <td>${transaction.salePrice}</td>
					        <td>${transaction.inDate}</td>
					        <td>${transaction.isSale}</td>
					    </tr>
					</c:forEach>


				</table>
			</main>
<jsp:include page="../footer.jsp"/>
            
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>

</html>