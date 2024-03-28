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
    <link href="/giftiApp/css/styles.css" rel="stylesheet" />
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
                    <h3 class="mt-4"><span class="text-primary">회원관리 </span>> 유저 상세 조회</h3>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">유저 상세 화면</li>
                    </ol>
                </div>
                <hr class="mb-40">
                <br>
                <div class="container col-12 ">
                    <form action="userUpdate.do" method="post">
                        <table class="table-bordered center-table">
                            <tr>
								<td class="col-1" colspan="2" rowspan="4" style="text-align: center;">
								    <i class="fa-solid fa-user" style="width: 200px; height: 200px; margin: auto;"></i>
								</td>
                                <th class="col-2">이름</th>
                                <td class="col-4">${user.name}</td>
                                <!-- 나중에 value 수정 -->
                            </tr>
                            <tr>
                            
                                <th>아이디</th>
                                <td>${user.userId}</td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td>*********</td>

                            </tr>
                            <tr>
                                <th>닉네임</th>
                                <td>${user.nickname}</td>

                            </tr>
                            <tr>
                                <th class="col-1">성별</th>
                                <td>
                                <c:if test="${user.gender == '남'}">
							        <input type="radio" name="gender" value="male" checked onclick="return(false);"> 남자 &nbsp;&nbsp;
							        <input type="radio" name="gender" value="female" onclick="return(false);"> 여자 &nbsp;&nbsp;
							    </c:if>
							    <c:if test="${user.gender != '남'}">
							        <input type="radio" name="gender" value="male" onclick="return(false);"> 남자 &nbsp;&nbsp;
							        <input type="radio" name="gender" value="female" checked onclick="return(false);"> 여자 &nbsp;&nbsp;
							    </c:if>
                                </td>
							    
                                <th>나이</th>
                                <td>${user.age}</td>
                            </tr>
                        </table>
                        <table class="table-bordered center-table" style="margin-top: 10px; width: 600px;">
                            <tr>
                                <th style="width: 300px;">이메일</th>
                                <td style="width: 300px;">${user.email}</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td style="width: 300px;">${user.phone}</td>
                            </tr>
                            <tr>
                                <th>지역</th>
                                <td style="width: 300px;">${user.address}</td>
                            </tr>
                            <tr>
                                <th>활동상태</th>
                                <td>
                                <c:if test="${user.status eq 'ing'}">
							        <input type="radio" name="status" value="ing" checked onclick="return(false);"> 활동 &nbsp;&nbsp;
							        <input type="radio" name="status" value="stop" onclick="return(false);"> 정지 &nbsp;&nbsp;
							    </c:if>
							    <c:if test="${user.status ne 'ing'}">
							        <input type="radio" name="status" value="ing" onclick="return(false);"> 활동 &nbsp;&nbsp;
							        <input type="radio" name="status" value="stop" checked onclick="return(false);"> 정지 &nbsp;&nbsp;
							    </c:if>
                                </td>
                                
                            </tr>
                            <tr>
                              <th colspan="2" style="background-color: whitesmoke;">
							    <div class="d-grid gap-2 d-md-flex justify-content-md-center">
								<input type="button" value="수정" onclick="location.href='userUpdateView.user?userId=${user.userId}'">
							    </div>
							</th>

                            </tr>
                        </table>

                    </form>
                    <br>
                    <br>
                    <hr style="width:50%; margin:auto;'">
                    <br>
					<h4 class="text-center">판매 상품</h4>
					<br>
                    <table class="table-bordered center-table" id="saleList">
							<tr>
							<th>거래번호</th>
							<th>상품명</th>
							<th>판매가격</th>
							<th>등록일</th>
							<th>판매상태</th>
							</tr>
					<c:forEach var="transaction" items="${userTrans}">
					    <tr>
					        <td>${transaction.registerId}</td>
					        <td>${transaction.itemName}</td>
					        <td>${transaction.salePrice}</td>
					        <td>${transaction.inDate}</td>
					        <td>${transaction.isSale}</td>
					    </tr>
					</c:forEach>

                    </table> 

                </div>

			<br><br>
            </main>
			<jsp:include page="../footer.jsp"/>
            
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="/giftiApp/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="/giftiApp/js/datatables-simple-demo.js"></script>
</body>

</html>