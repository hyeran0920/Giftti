<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Tables - SB Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="../css/styles.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
  <jsp:include page="../topNav.jsp"/>
  <div id="layoutSidenav">
    <jsp:include page="../sidebar.jsp"/>
    <div id="layoutSidenav_content">
      <main>
        <!-- START -->
        <div class="container-fluid px-4">
          <h1 class="mt-4">판매 상세 내역</h1>
          <!-- 나중에 ${name}으로 가져오면될듯 -->
          <ol class="breadcrumb mb-10">
            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
            <li class="breadcrumb-item active"><a href="#"></a>상품 관리</li>
          </ol>

          <!-- TABLE START -->
          <div class="card-body">
            <h3> 관리자 상품 조회 </h3>
            <table id="datatablesSimple" class="table table-bordered justify-content-center">
              <thead>
              </thead>
              <tbody>

                <tr>
                  <th>등록번호</th>
                  <td>${saleItem.registerId}</td>
                </tr>
                <tr>
                  <th>등록회원</th>
                  <td>${saleItem.sellId}</td>
                </tr>
                <tr>
                  <th>판매가</th>
                  <td>${saleItem.salePrice}</td>
                </tr>
                <tr>
                  <th>할인율</th>
                  <td>${saleItem.discount}</td>
                </tr>
                <tr>
                  <th>유효 기간</th>
                  <td>${saleItem.availDate}</td>
                </tr>
                <tr>
                  <th>등록 일자</th>
                  <td>${saleItem.inDate}</td>
                </tr>




              </tbody>
            </table>
            <div class="box-footer text-center">
              <!-- {% if session_user_name == orm_obj.writer %} -->
              <button type="submit" class="btn btn-primary btn-sm" onclick="history.back()">뒤로가기 </button>

              <!-- {% endif %} -->
            </div>
          </div>
        </div>
      </main>
      <jsp:include page="../footer.jsp"/>    
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="../js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
    crossorigin="anonymous"></script>
  <script src="../js/datatables-simple-demo.js"></script>
</body>

</html>