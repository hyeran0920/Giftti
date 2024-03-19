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
    <title>상품 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/giftiApp/css/styles.css" rel="stylesheet" />
    <link rel="icon" type="images/png" href="/giftiApp/images/pavicon.png">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<style>
	</style>
	<script>
    	function checkProductInsert(){
			const itemName = document.querySelector('#item_name');
            const price = document.querySelector('#price');
            const category = document.querySelector('#category');
            const brand = document.querySelector('#brand');

            if(itemName.value.length === 0){
                alert('상품명을 입력하세요');
                return false;
            }
            if(isNaN(price.value)){
                alert('가격은 숫자로 입력하세요.')
                return false;
            }
            if(category.value === '카테고리 선택'){
                alert('카테고리를 선택하세요.')
                return false;
            }
            if(brand.value.length === 0){
                alert('브랜드를 입력하세요.')
                return false;
            }
            return true;
		}
</script>
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
                    <h3 class="mt-4">
						<span class="text-primary">상품관리 </span>> 상품등록
					</h3>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">상품 등록 화면</li>
					</ol>
                    
                    <hr class="mb-40">
                    <!-- TABLE START -->
                    <div class="card-body">
                        <h3> 관리자 상품 등록 </h3>
                        <form action="giftInsert.product" method="post" enctype="multipart/form-data" onsubmit="return checkProductInsert()">
                        	<table id="datatablesSimple" class="table table-bordered justify-content-center">
                            <thead>
                            </thead>
                            <tbody>
                           		 <tr>
                                    <th>등록번호</th>
                                    <td><input type="text" class="form-control" name="item_id" value=${itemId } readonly > </td>
                                </tr>
                                <tr>
                                    <th>상품명</th>
                                    <td><input type="text"  class="form-control" name="item_name" id="item_name"> </td>
                                </tr>

                                <tr>
                                    <th>정가</th>
                                    <td><input type="text"  class="form-control" name="price" id="price"> </td>
                                </tr>
                                <th>카테고리</th>
                                    <td>
                                     
                                        <select  class="form-control" name="category" id="category">
                                        	<option selected="selected">카테고리 선택</option>
                                        	<c:forEach var="category" items="${ categories}">
		                                        <option value="${category }">${category }</option>
                                        	</c:forEach>
                                        </select> 
                                       
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <th>브랜드</th>
                                    <td>
                                        <input type="text"  class="form-control" name="brand"  id="brand">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th>이미지</th>
                                    <td>
                                    	<input type="file"  class="form-control" name="image">
 
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
    <script src="/giftiApp/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="/giftiApp/js/datatables-simple-demo.js"></script>
</body>

</html>