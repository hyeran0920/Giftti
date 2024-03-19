<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>유저 조회</title>
<link rel="icon" type="images/png" href="/giftiApp/images/pavicon.png">
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
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
	<jsp:include page="topNav.jsp" />
	<div id="layoutSidenav">
		<jsp:include page="sidebar.jsp" />
		<div id="layoutSidenav_content">

<<<<<<< HEAD
			<jsp:include page="footer.jsp" />

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
=======
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><a class="text-primary" href="#">BCD234</a></td>
                                    <td>김자바</td>
                                    <td>자바짱</td>
                                    <td>여자</td>
                                    <td>010-2345-6789</td>
                                    <td>10대</td>
                                    <td>경기도 성남시</td>
                                    <td>정지회원 &nbsp;
                                        <button type="submit" class="btn btn-primary btn-sm"
                                                id="btn_update">수정</button></td>
                                    <td><a class="text-primary" href="productSaleList.html?id=<${ user.id }">5</a></td>
                                    <!-- COUNT로 가져오기-->
                                    <td><a class="text-primary" href="productSaleList.html?id=<${ user.id }">9</a></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td><a class="text-primary" href="#">CDE345</a></td>
                                    <td>박디비</td>
                                    <td>마이SQL</td>
                                    <td>남자</td>
                                    <td>010-3456-7890</td>
                                    <td>30대</td>
                                    <td>서울특별시 관악구</td>
                                    <td>일반회원 &nbsp;
                                        <button type="submit" class="btn btn-primary btn-sm"
                                                id="btn_update">수정</button></td>
                                    <td><a class="text-primary" href="productSaleList.html?id=<${ user.id }">4</a></td>
                                    <td><a class="text-primary" href="productSaleList.html?id=<${ user.id }">1</a></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td><a class="text-primary" href="#">DEF456</a></td>
                                    <td>쾌걸춘향</td>
                                    <td>이춘향</td>
                                    <td>여자</td>
                                    <td>010-0123-4567</td>
                                    <td>20대</td>
                                    <td>경기도 수원시</td>
                                    <td>일반회원 &nbsp;
                                        <button type="submit" class="btn btn-primary btn-sm"
                                                id="btn_update">수정</button></td>
                                    <td><a class="text-primary" href="productSaleList.html?id=<${ user.id }">8</a></td>
                                    <td><a class="text-primary" href="productSaleList.html?id=<${ user.id }">20</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
			<jsp:include page="footer.jsp"/>
            
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
>>>>>>> branch 'develop' of https://github.com/hyeran0920/JavaMiniProject.git
</body>

</html>