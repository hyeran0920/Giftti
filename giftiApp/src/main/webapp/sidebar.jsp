<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="icon" type="images/png" href="./images/pavicon.png">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<style>
		.text-color-giffty{
			color: black;
		}
		.text-color-giffty-h{
			color: black;
		}
		.text-color-giffty-h:hover{
			color: #D93644;
		}
		
		@font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}	
		.sideTotal{
			font-family: 'NEXON Lv1 Gothic OTF';
		}
		
	</style>
</head>
<body>
<div id="layoutSidenav_nav" class="sideTotal">
            <nav class="sb-sidenav accordion sb-sidenav-dark bg-light" id="sidenavAccordion">
           
                <div class="sb-sidenav-menu">
                    <div class="nav">

                        <div class="sb-sidenav-menu-heading"><span class="text-color-giffty">회원</span>
                        </div>
                        <span class="sideTitle">
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts-user" aria-expanded="false"
                            aria-controls="collapseLayouts-user">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns text-color-giffty"></i></div>
                            <span class="text-color-giffty font-nexon">회원 관리</span>
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down text-color-giffty"></i></div>
                        </a>
                        </span>
                        <div class="collapse" id="collapseLayouts-user" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="userList.html"><span class="text-color-giffty-h">유저 조회</span></a>
                                <a class="nav-link" href="userInfo.html"><span class="text-color-giffty-h">유저 수정</span></a>
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading"><span class="text-color-giffty">상품</span>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts-product" aria-expanded="false"
                            aria-controls="collapseLayouts-product">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns text-color-giffty"></i></div>
                            <span class="text-color-giffty">상품 관리</span>
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down text-color-giffty"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts-product" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="giftList.product"><span class="text-color-giffty-h">상품 조회</span></a>
                                <a class="nav-link" href="giftInsertView.product"><span class="text-color-giffty-h">상품 등록</span></a>
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading"><span class="text-color-giffty">거래</span></div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts-tran" aria-expanded="false"
                            aria-controls="collapseLayouts-tran">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-columns text-color-giffty"></i>
                            </div>
                            <span class="text-color-giffty">거래 관리</span>
                            <div class="sb-sidenav-collapse-arrow">
                                <i class="fas fa-angle-down text-color-giffty"></i>
                            </div>
                        </a>
                        <div class="collapse" id="collapseLayouts-tran" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link text-color-giffty" href="./TransList.html"><span class="text-color-giffty-h">거래 내역</span></a><!--거래 조회페이지-->
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading"><span class="text-color-giffty">고객지원</span></div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts-customer" aria-expanded="false"
                            aria-controls="collapseLayouts-customer">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-columns text-color-giffty"></i>
                            </div>
                            <span class="text-color-giffty">고객 지원</span>
                            <div class="sb-sidenav-collapse-arrow">
                                <i class="fas fa-angle-down text-color-giffty"></i>
                            </div>
                        </a>
                        <div class="collapse" id="collapseLayouts-customer" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link text-color-giffty" href="#" ><span class="text-color-giffty-h">신고 신청 게시판</span></a><!--신고 게시판페이지-->
                                <a class="nav-link text-color-giffty" href="#"><span class="text-color-giffty-h">신고 내역 조회</span></a><!--상품 조회페이지-->
                            </nav>
                        </div>



                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#pagesCollapseAuth" aria-expanded="false"
                                    aria-controls="pagesCollapseAuth">
                                    Authentication
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="login.html">Login</a>
                                        <a class="nav-link" href="register.html">Register</a>
                                        <a class="nav-link" href="password.html">Forgot Password</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#pagesCollapseError" aria-expanded="false"
                                    aria-controls="pagesCollapseError">
                                    Error
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordionPages">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="401.html">401 Page</a>
                                        <a class="nav-link" href="404.html">404 Page</a>
                                        <a class="nav-link" href="500.html">500 Page</a>
                                    </nav>
                                </div>
                            </nav>
                        </div>

                    </div>

            </nav>
        </div>
</body>
</html>