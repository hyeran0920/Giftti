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
    <title>FAQ 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link rel="icon" type="images/png" href="/giftiApp/images/pavicon.png">
    <link href="/giftiApp/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
		function checkFAQInsert(){
			const faquestion = document.querySelector('#faquestion');
	        const answer = document.querySelector('#answer');
	        const qcategory = document.querySelector('#qcategory');
	
	        if(faquestion.value.length === 0){
	            alert('질문 내용을 입력하세요');
	            return false;
	        }
	        if(answer.value.length === 0){
	            alert('응답 내용을 입력하세요');
	            return false;
	        }
	        
	       if(qcategory.value.length === 0){
	            alert('질의응답의 카테고리를 입력하세요.')
	            return false;
	        }//선택하는 걸로 어떻게 바꾸지
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
						<span class="text-primary">고객지원 </span>> 질의응답등록
					</h3>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">FAQ 등록</li>
					</ol>
                    
                    <hr class="mb-40">
                    <!-- TABLE START -->
                    <div class="card-body">
                        <h3> FAQ 등록 </h3>
                        <form action="FAQInsert.customerservice" method="post" onsubmit="return checkFAQInsert()">
                        	<table id="datatablesSimple" class="table table-bordered justify-content-center">
                            <thead>
                            </thead>
                            <tbody>
                           		 
                                <tr>
                                    <th>질문 내용</th>
                                    <td><input type="text"  class="form-control" name="faquestion" id="faquestion" > </td>
                                </tr>

                                <tr>
                                    <th>응답 내용</th>
                                    <td><textarea rows="5" cols="100" name="answer" id="answer" class="form-control"></textarea>
                                </tr>
                                <th>카테고리</th>
                                    <td>
                              <select class="form-select" aria-label="Default select example"id="qcategory" name="qcategory">
  								<option selected value=${category }>${category }</option>
  								<c:if test="${category ne '상품관련'}">
  									<option value="상품관련">상품관련</option>
  								</c:if>
  								<c:if test="${category ne '결제관련'}">
  									<option value="결제관련">결제관련</option>
  								</c:if>
  								<c:if test="${category ne '서비스이용'}">
  									<option value="서비스이용">서비스이용</option>
  								</c:if>
  								<c:if test="${category ne '서비스안내'}">
  									<option value="서비스안내">서비스안내</option>
  								</c:if>
  								
  								
								</select>
                                        
                                        
                                    </td>
                               
							</form>
                            </tbody>
                        </table>
                        <div class="box-footer text-center">
                            <button type="submit" class="btn btn-primary btn-sm" id="btn_update">등 록</button>

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
    <script src="/giftiApp/js/datatables-simple-demo.js"></script>
</body>

</html>