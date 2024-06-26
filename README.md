# 제 1차 자바 프로젝트

<img src="https://github.com/hyeran0920/JavaMiniProject/assets/156064008/4b5e4d27-6700-49a4-ba40-1f7deaf4db30" width="300" height="300"/>

https://youtu.be/-1_zAzSrjbA?si=D6NCf3hU6USY2-e_

### 기쁘띠          쁘띠 조


#### 기프티콘 거래 중개 웹 관리자 페이지



중앙인재개발원 클라우드 데브옵스 프론트엔드&백엔드 자바 풀스택 개발자 취업캠프 




---

### 팀원 소개
|<img src="https://avatars.githubusercontent.com/u/93534308?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/156066188?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/156064008?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/156064523?v=4" width="150" height="150"/>|
|:-:|:-:|:-:|:-:|
|서유진<br/>[@hyeran0920](https://github.com/hyeran0920)<br/> 회원관리|유지연<br/>[@JiyeonU](https://github.com/JiyeonU)<br/>FAQ |이성훈</br>[@conchohi](https://github.com/conchohi)<br/>상품관리|최현철<br/>[@choi2890](https://github.com/choi2890)<br/>거래관리|
--- 

### # 프로젝트 목적
관리자가 카테고리를 설정하여 판매 가능한 상품을 등록하고

사용자가 기프티콘을 구매/판매 할 수 있도록 중개하는 웹 사이트의 관리자 페이지 구현

**JDBC, JSP, SERVLET 을 바탕으로 CRUD 기능 구현에 목적을 둠**

---
### # 사용자 페이지
<img width="1331" alt="KakaoTalk_Photo_2024-04-22-22-59-10" src="https://github.com/hyeran0920/JavaMiniProject/assets/93534308/f07097c6-c9fc-4537-8188-5e5f8588b0b4">

### # 관리자 페이지
![IMG_DAFF43C25F66-1](https://github.com/hyeran0920/JavaMiniProject/assets/93534308/59047f7f-e424-4847-84dd-93ffaafa4d01)

---

### # 개발 환경
![html](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) ![css](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white) ![js](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white) ![java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white) 
![mysql](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white) ![notion](https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white) ![git](https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white) ![google](https://img.shields.io/badge/Google-4285F4?logo=google&logoColor=fff&style=for-the-badge)
- 언어 : Java (JDK 17), JSP, Servlet, HTML5, CSS3, Javascript
- 서버 : Apache Tomcat 9.0
- DB : MySQL 8.0.27
- IDE : Eclipse 2023-03, MySQL workbench, VSCode
- 협업 도구 : Github, Notion, Google Drive

---

### # 요구사항


#### 1. `상품`
- 전체 상품 목록을 **조회**할 수 있어야 한다.
- 특정 상품을 **상세 조회**할 수 있어야 한다
- 상품을 **등록, 수정, 삭제**할 수 있어야 한다.
- 관리자는 상품 등록 시 **브랜드, 카테고리, 이름, 가격, 대표 이미지**를 지정해야 한다.

#### 2. `유저`
- 사용자는 **회원가입, 로그인**을 해야 한다.
- 사용자 목록을 **조회**할 수 있어야 한다.
- 사용자 제제를 위해 활동 상태를 **수정**할 수 있어야 한다.

#### 3. `거래`
- 현재 판매 등록 내역, 거래 완료된 내역 모두 **조회**할 수 있어야 한다.
- 잘못된 판매 등록 내역은 **삭제**할 수 있어야 한다.

#### 4. `고객 지원`
- 자주 묻는 질문을 통해 사용자의 불편함을 줄여야 한다.
- 자주 묻는 질문을 **등록, 수정, 삭제**할 수 있어야 한다.

---

### # ERD
<img width="941" alt="미니프로젝트 (1)" src="https://github.com/hyeran0920/JavaMiniProject/assets/156064008/32564d6b-d115-4cea-89b8-9d0fd75d2cce">

---

### #WBS

<img width="1131" alt="image" src="https://github.com/hyeran0920/JavaMiniProject/assets/93534308/cc87e32d-e237-4cf0-9be3-f8e501941174">

---
### # 컨트롤러 구현
프론트 컨트롤러 패턴 활용
- 상품 : *.product
- 유저 : *.user
- 거래 : *.trans
- 고객지원 : *.customerservice
- 로그인 : *.do
