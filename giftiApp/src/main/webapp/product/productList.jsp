<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
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
    <link rel="icon" type="images/png" href="/giftiApp/images/pavicon.png">
    <link href="/giftiApp/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<style type="text/css">
		button {
			cursor: pointer;
		}
		@font-face {
    	font-family: 'NEXON Lv1 Gothic OTF';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    	font-weight: normal;
    		font-style: normal;
		}	
		.sb-nav-fixed{
			font-family: 'NEXON Lv1 Gothic OTF';
		}
		a{
		font-size:16px;
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
                    <h3 class="mt-4">
						<span class="text-primary">상품관리 </span>> 상품조회
					</h3>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">상품 관리 화면</li>
					</ol>
                    
                    <hr class="mb-40">
							    <style>
							    	li.category{
							    		margin : 0 3px;
							    	}
							    	li.category:hover{
							    		background-color: #ccc;
							    	}
							    </style>
                   <nav class="navbar navbar-expand-lg navbar-light bg-light">
					    <div class="container-fluid">
					            <ul class="navbar-nav">
					                <li class="nav-item category">
					                    <a class="nav-link" href="giftList.product">전체 보기</a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategory.product?category=패스트푸드">
					                        <img src="/giftiApp/images/burger.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
					                        패스트푸드
					                    </a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategory.product?category=베이커리">
					                        <img src="/giftiApp/images/bread.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
					                        베이커리
					                    </a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategory.product?category=치킨/피자">
					                        <img src="/giftiApp/images/fast-food.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
					                        치킨/피자
					                    </a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategory.product?category=커피/음료">
					                        <img src="/giftiApp/images/cafe.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
					                        커피/음료
					                    </a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategory.product?category=아이스크림">
					                        <img src="/giftiApp/images/ice-cream.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
					                        아이스크림
					                    </a>
					                </li>
					                <li class="nav-item category">
					                    <a class="nav-link" href="findCategory.product?category=마트/편의점">
					                        <img src="/giftiApp/images/convenience-store.png" alt="" width="30" height="24" class="d-inline-block align-text-top">
					                        마트/편의점
					                    </a>
					                </li>
					            </ul>
					            <button type="submit" class="btn btn-secondary btn-sm "
                                                id="btn_delete" onclick="location.href='giftInsertView.product'"><i class="fa-solid fa-plus"></i> 상품 추가</button>
					    </div>
					</nav>
					<div class="card mb-4">
					
                    <!-- TABLE START -->
                    <div class="card-header">
						<i class="fas fa-table me-1"></i> 상품 전체 조회
					</div>
                    <div class="card-body">
                    	
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th>아이템ID</th>
                                    <th>상품명</th>
                                    <th>정가</th>
                                    <th>카테고리</th>
                                    <th>브랜드</th>
                                    <th>수정 삭제</th>
                                    <th>등록수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${products}">
                                	<tr>
                                		<td>${product.itemId}</td>
                                		<td><a href="giftInfo.product?itemId=${product.itemId}">${product.itemName }</a></td>
                                		<td><fmt:formatNumber value="${product.price}" pattern="#,###원"/></td>
                                		<td>${product.category }</td>
                                		<td>${product.brand }</td>
                                		<td>
                                        <div class="box-footer">
                                            <!-- {% if session_user_name == orm_obj.writer %} -->
                                            <button type="submit" class="btn btn-primary btn-sm"
                                                id="btn_update" onclick="location.href='giftUpdateView.product?itemId=${product.itemId}'"><i class="fa-solid fa-pen"></i></button>
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                id="btn_delete" onclick="location.href='giftDelete.product?itemId=${product.itemId}'"><i class="fa-solid fa-trash"></i></button>
                                        </div> 
                                    	</td>
                                    	<c:url value="sellList.trans" var="sellList">
                                    		<c:param name="itemId" value="${product.itemId }"/>
                                    		<c:param name="itemName" value="${product.itemName }"/>
                                    	</c:url>
                                		<td><a href="productSaleList.trans?itemId=${product.itemId }">${product.count }</a></td>
                                	</tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
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