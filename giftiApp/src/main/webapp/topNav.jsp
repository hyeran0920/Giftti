<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="icon" type="/giftiApp/images/png" href="./images/pavicon.png">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/giftiApp/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
    <style type="text/css">
    	.song-myung-regular {
        font-family: "Song Myung", serif;
        font-weight: 400;
        font-style: normal;
        
        }
        @font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}	
		        a{
        	text-decoration: none;
        	font-family: 'NEXON Lv1 Gothic OTF';
        }
        a:visited{
        	text-decoration: none;
        }
        
		
    </style>
</head>
<body>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-light">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3 topLogo bg-light" href="index.jsp">
            <img class="logo" src="/giftiApp/images/Logo.png">
            <style>
                .logo {
                    width: 30px;
                    margin-right: 8px;
                }
				
            </style>
            <span style="color: #D93644; font-size: 1.3em;" class="song-myung-regular">GIFFTY</span>
        </a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" style="color: #D93644; href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <a href="#" style="color: #D93644;"><i class="fas fa-user fa-fw"></i> 로그아웃 </a>
                
        </ul>
    </nav>
</body>
</html>