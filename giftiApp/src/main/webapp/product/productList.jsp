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
    <title>상품 리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<style type="text/css">
		button {
			cursor: pointer;
		}
	</style>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../topNav.jsp"/>
    <div id="layoutSidenav">
        <jsp:include page="../sidebar.jsp"/>
        <div id="layoutSidenav_content">
            <main>
                <!-- START -->
                <div class="container-fluid px-4">
                    <h1 class="mt-4">상품조회</h1>
                    <ol class="breadcrumb mb-10">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="#"></a>상품 관리</li>
                        밑에있는걸 지우고싶은데 script url로 연결됨
                    </ol>

                    <!-- TABLE START -->
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>아이템ID</th>
                                    <th>상품명</th>
                                    <th>정가</th>
                                    <th>브랜드</th>
                                    <th>카테고리</th>
                                    <th>수정 삭제</th>
                                    <th>등록수</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>ItemId</th>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <c:forEach var="product" items="${products}">
                                	<tr>
                                		<td>${product.itemId}</td>
                                		<td><a href="/product/giftUpdateView.do?itemId=${product.itemId}">${product.itemName }</a></td>
                                		<td>${product.price }</td>
                                		<td>${product.brand }</td>
                                		<td>${product.category }</td>
                                		<td>
                                        <div class="box-footer">
                                            <!-- {% if session_user_name == orm_obj.writer %} -->
                                            <button type="submit" class="btn btn-primary btn-sm"
                                                id="btn_update" onclick="location.href='/product/giftUpdateView.do?itemId=${product.itemId}'">수정</button>
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                id="btn_delete" onclick="location.href='/product/gitftDelete.do?itemId=${item.id}'">삭제</button>
                                        </div>
                                    	</td>
                                		<td><a href="/trans/sellList.do?itemId=${product.itemId}">${product.count }</a></td>
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
    <script src="../js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
</body>

</html>