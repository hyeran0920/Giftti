<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>유저 상세 조회</title>
    <link rel="icon" type="images/png" href="./images/pavicon.png">
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: "Noto Sans KR", sans-serif;
        }

        th,
        td {
            height: 40px;
        }

        th {
            text-align: center;
            background-color: #c0c0c0;
        }

        td {
            padding-left: 20px;
        }

        table {
            width: 600px;
            margin: 0 auto;
        }

        #saleList {
            text-align: center;
            width: 800px;
        }
    </style>
</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3 topLogo" href="index.jsp">
            <img class="logo" src="./images/logo.png">
            <style>
                .logo {
                    width: 30px;
                    margin-right: 8px;
                }

            </style>
            <span>기쁘띠</span>
        </a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                    aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                        class="fas fa-search"></i></button>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">

                        <div class="sb-sidenav-menu-heading">회원
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts-user" aria-expanded="false"
                            aria-controls="collapseLayouts-user">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            회원 관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts-user" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="userList.html">유저 조회</a>
                                <a class="nav-link" href="userInfo.html">유저 수정</a>
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading">상품
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts-product" aria-expanded="false"
                            aria-controls="collapseLayouts-product">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            상품 관리
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts-product" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="productList.jsp">상품 관리</a>
                                <a class="nav-link" href="productInsert.jsp">상품 등록</a>
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading">거래</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts-tran" aria-expanded="false"
                            aria-controls="collapseLayouts-tran">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-columns"></i>
                            </div>
                            거래 관리
                            <div class="sb-sidenav-collapse-arrow">
                                <i class="fas fa-angle-down"></i>
                            </div>
                        </a>
                        <div class="collapse" id="collapseLayouts-tran" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="./TransList.jsp">거래 내역</a><!--거래 조회페이지-->
                            </nav>
                        </div>
                        <div class="sb-sidenav-menu-heading">고객지원</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts-customer" aria-expanded="false"
                            aria-controls="collapseLayouts-customer">
                            <div class="sb-nav-link-icon">
                                <i class="fas fa-columns"></i>
                            </div>
                            고객
                            <div class="sb-sidenav-collapse-arrow">
                                <i class="fas fa-angle-down"></i>
                            </div>
                        </a>
                        <div class="collapse" id="collapseLayouts-customer" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="#">신고 신청 게시판</a><!--신고 게시판페이지-->
                                <a class="nav-link" href="#">신고 내역 조회</a><!--상품 조회페이지-->
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
                                        <a class="nav-link" href="login.jsp">Login</a>
                                        <a class="nav-link" href="register.jsp">Register</a>
                                        <a class="nav-link" href="password.jsp">Forgot Password</a>
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
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h3 class="mt-4"><span class="text-primary">회원관리</span>>유저 상세 조회</h3>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">유저 상세 화면</li>
                    </ol>
                </div>
                <hr class="mb-40">
                <div class="container col-12">
                    <form action="userUpdate.do" method="post">
                        <table class="table-bordered">
                            <tr>
                                <td colspan="2" rowspan="4"><img src="./images/user.png" alt="유저 이미지"
                                        style="width: 200px; height: 200px; margin-left: 30px;"></td>
                                <th class="col-3">이름</th>
                                <td class="col-4"><input class="col-10" type="text" name="name" value="${user.name}">
                                </td>
                                <!-- 나중에 value 수정 -->
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td><input class="col-10" type="text" name="user_id" value="${user.id}" readonly></td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td><input class="col-10" type="password" name="password" value="${user.password}"></td>

                            </tr>
                            <tr>
                                <th>닉네임</th>
                                <td><input class="col-10" type="text" name="user_id" value="${user.nickname}"></td>

                            </tr>
                            <tr>
                                <th class="col-3">성별</th>
                                <td><select name="gender" id="gender">
                                        <option value="M">남자</option>
                                        <option value="F">여자</option>
                                    </select></td>
                                <th>나이</th>
                                <td>20대</td>
                            </tr>
                        </table>
                        <table class="table-bordered" style="margin-top: 10px; width: 600px;">
                            <tr>
                                <th style="width: 300px;">이메일</th>
                                <td style="width: 300px;"><input type="text" name="email" value="${user.email}"></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td style="width: 300px;"><input type="text" name="email" value="${user.phone}"></td>
                            </tr>
                            <tr>
                                <th>지역</th>
                                <td style="width: 300px;"><input type="text" name="address" value="${user.address}">
                                </td>
                            </tr>
                            <tr>
                                <th>활동상태</th>
                                <td>
                                    <input type="radio" name="state" value="active" checked> 활동 &nbsp;&nbsp;
                                    <input type="radio" name="state" value="stop"> 정지 &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2" style="background-color: whitesmoke;">
                                    <input type="submit" value="수정">
                                </th>
                            </tr>
                        </table>

                    </form>
                    <hr class="mb-40px">

                    <table class="table-bordered" id="saleList">
                        <tr>
                            <th>거래 번호</th>
                            <th>판매상품 명</th>
                            <th>판매가</th>
                            <th>거래 일자</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>고추바사삭</td>
                            <td>15,000원</td>
                            <td>2024-01-01</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>떠먹는 아이스박스</td>
                            <td>5,000원</td>
                            <td>2024-02-01</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>교촌 허니콤보 + 웨지감자</td>
                            <td>18,000원</td>
                            <td>2024-02-04</td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td>싸이버거 세트</td>
                            <td>6,000원</td>
                            <td>2024-02-06</td>
                        </tr>
                        <tr>
                            <td>15</td>
                            <td>뿌링클</td>
                            <td>15,000원</td>
                            <td>2024-03-01</td>
                        </tr>

                    </table>

                </div>


            </main>

            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2023</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>

</html>