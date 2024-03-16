<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>상품 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
	<class class="sb-nav-fixed">
    <jsp:include page="../topNav.jsp"/>
    <div id="layoutSidenav">
        <jsp:include page="../sidebar.jsp"/>
        <div id="layoutSidenav_content">
            <main>
                <!-- START -->
                <div class="container-fluid px-4">
                    <h1 class="mt-4">${product.itemName } 상세 정보</h1>
                    <!-- 나중에 ${name}으로 가져오면될듯 -->
                    <ol class="breadcrumb mb-10">
                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="#"></a>상품 등록</li>
                    </ol>

                    <!-- TABLE START -->
                    <div class="card-body">
                        <h3> 관리자 상품 등록 </h3>
                        <form action="giftUpdate.product" method="post">
                        	<table id="datatablesSimple" class="table table-bordered justify-content-center">
                            <thead>
                            </thead>
                            <tbody>
                           		 <tr>
                                    <th>등록번호</th>
                                    <td><input type="text" class="form-control" name="item_id" value="${product.itemId }" readonly > </td>
                                </tr>
                                <tr>
                                    <th>상품명</th>
                                    <td><input type="text"  class="form-control" name="item_name" value="${product.itemName }"> </td>
                                </tr>

                                <tr>
                                    <th>정가</th>
                                    <td><input type="text"  class="form-control" name="price" required value="${product.price }"> </td>
                                </tr>
                                <th>카테고리</th>
                                    <td>
                                     
                                        <select  class="form-control" name="category" id="category" >
                       						<option value="${product.category }" selected="selected">${product.category }</option>
                                        	<c:forEach var="category" items="categories">
                                        		<c:if test="${category } ne ${product.category }">
		                                        	<option value="${category }">${category }</option>
                                        		</c:if>
                                        	</c:forEach>
                                        </select> 
                                       
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th>브랜드</th>
                                    <td>
                                    	<input type="text"  class="form-control" name="brand" value="${product.brand }" required>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th>이미지</th>
                                    <td>
                                    	<input type="text"  class="form-control" name="image" value="${product.image }">
 
                                    </td>
                                </tr>
							</form>
                            </tbody>
                        </table>
                        <div class="box-footer text-center">
                            <!-- {% if session_user_name == orm_obj.writer %} -->
                            <button type="submit" class="btn btn-primary btn-sm" id="btn_update">등록</button>

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