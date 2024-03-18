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
    <title>상품 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/giftiApp/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<style type="text/css">
		img.giftImage{
			width: 300px;
			height:300px;
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
	</style>
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
						<span class="text-primary">상품관리 </span>> ${product.itemName } 조회
					</h3>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">상품 관리 화면</li>
					</ol>
                    

                    
                    <hr class="mb-40">
                    <!-- TABLE START -->
                    <div class="card-body">
                        <h3> 관리자 상품 정보 </h3>
                        	<table id="datatablesSimple" class="table table-bordered justify-content-center">
                            <thead>
                            </thead>
                            <tbody>
                           		 <tr>
                                    <th>등록번호</th>
                                    <td>${product.itemId }</td>
                                </tr>
                                <tr>
                                    <th>상품명</th>
                                    <td>${product.itemName }</td>
                                </tr>

                                <tr>
                                    <th>정가</th>
                                    <td>${product.price } </td>
                                </tr>
                                <tr>
                                	<th>카테고리</th>
                                    <td>${product.category }</td>
                                </tr>
                                <tr>
                                    <th>브랜드</th>
                                    <td>
                                    ${product.brand }
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th>이미지</th>
                                    <td>
										<img class="giftImage" src="/giftiApp/productImages/${product.image }" alt="$Product.image"> 
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="box-footer text-center">
                            <!-- {% if session_user_name == orm_obj.writer %} -->
                            <button type="submit" class="btn btn-primary btn-sm" id="btn_update" onclick="location.href='giftUpdateView.product?itemId=${product.itemId}'">수정</button>

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