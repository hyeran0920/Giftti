<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>판매중 내역</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link rel="icon" type="images/png" href="/giftiApp/images/pavicon.png">
    <link href="/giftiApp/css/styles.css" rel="stylesheet" />
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
                    <<h3 class="mt-4">
						<span class="text-primary">상품관리 </span>> 판매중 내역
					</h3>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">판매중인 상품 내역</li>
					</ol>

                    
                    <hr class="mb-40">
                    <!-- TABLE START -->
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>등록번호</th>
                                    <th>등록회원</th>
                                    <th>판매가</th>
                                    <th>할인율</th>
                                    <th>유효 기간</th>
                                    <th>등록 일자</th>
                                    <th>삭제</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>register_id</th>
                                    <th>user_id</th>
                                    <th>sale_price</th>
                                    <th>discount</th>
                                    <th>avail_date</th>
                                    <th>inDate</th>
                                </tr>
                            </tfoot>
                            <tbody>
								<c:forEach var="saleItem" items="${saleItems}">
								<tr>
                                    <td><a href="sellInfo.trans?registerId=${saleItem.registerId}">${saleItem.registerId}</a></td>
                                    <td>${saleItem.userId}</td>
                                    <td><fmt:formatNumber value="${saleItem.salePrice}" pattern="#,###원"/></td>
                                    <td><fmt:formatNumber value="${saleItem.discount}" pattern="0.#%"/></td>
                                    <td>${saleItem.availDate }</td>
                                    <td>${saleItem.inDate} </td>
                                    <td><button class="btn btn-danger btn-sm" onclick="location.href='saleDelete.trans?registerId=${saleItem.registerId}'">삭제</button></td>
                                </tr>
								
								</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
            <jsp:include page="../footer.jsp"/>
            
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="/giftiApp/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="/giftiApp/js/datatables-simple-demo.js"></script>
</body>

</html>