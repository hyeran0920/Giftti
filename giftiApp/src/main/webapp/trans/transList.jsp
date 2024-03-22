<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>거래 내역</title>
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
                  <span class="text-primary">거래관리 </span>> 거래완료 내역
               </h3>
               <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item active">거래 내역 화면</li>
               </ol>
            </div>
            <hr class="mb-40">
            <div class="card mb-4">
               <div class="card-header">
                  <i class="fas fa-table me-1"></i>거래 완료 조회
               </div>
               <div class="card-body">
                  <table id="datatablesSimple">
                     <thead>
                        <tr>
							<th>거래 일자</th>	
                            <th>판매번호</th>
                                    <th>카테고리</th>
                                    <th>판매 상품명</th>
                                    <th>판매자 ID</th>
                                    <th>구매자 ID</th>
                             <th>거래번호</th>       
                        </tr>
                        
                     </thead>
                    
                     <tbody>
                        <c:forEach var="trans" items="${transactions}">
            
                           <tr>
                        
                              <td>${trans.transDate}</td>
                              <td>${trans.registerId}</td>
                              <td><a href="findCategory.product?category=${trans.category}">${trans.category}</a></td>
                              <td><a href="giftInfo.product?itemId=${trans.itemId}">${trans.itemName}</a></td>
                              <td><a href="userInfo.user?userId=${trans.userId}">${trans.userId}</a></td>
                              <td><a href="userInfo.user?userId=${trans.buyId}">${trans.buyId}</a></td>
                              <td>${trans.transNum}</td>
                              
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