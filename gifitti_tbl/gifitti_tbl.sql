drop database if exists gifittidb;


create database gifittidb;
use gifittidb;
drop table if exists user_tbl;


-- 유저 테이블
create table user_tbl(
    user_id VARCHAR(20)  PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,  -- char에서 varchar??
    email VARCHAR(20) NOT NULL,
    phone CHAR(13),
    gender char(1),
    age INT,
    address VARCHAR(50),
    status char(5),
    nickname VARCHAR(50)
    );
    
-- 기프티콘 테이블


CREATE TABLE IF NOT EXISTS gifticon_tbl (
    item_id INT AUTO_INCREMENT PRIMARY KEY, -- 아이템 ID (기본키) 자동증가
    item_name VARCHAR(50) NOT NULL, -- 상품명 크기 변경 사항
    price int NOT NULL, -- 가격
    brand VARCHAR(20), -- 브랜드 변경사항 크기
    category VARCHAR(10), -- 카테고리
    image VARCHAR(10) -- 이미지 URL이 입력이 안됨
);


-- 판매 테이블
drop table if exists sale_tbl;

CREATE TABLE sale_tbl (
    register_Id INT AUTO_INCREMENT PRIMARY KEY, -- 등록번호 ID (기본키) 자동증가
    sale_price int NOT NULL,
    avail_date datetime NOT NULL,
    insale ENUM('Available', 'Sold') NOT NULL DEFAULT 'Available',  -- 변경 사항 기본값설정
    inDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 현재 등록 시간 바로 뜨게
    sale_date DATETIME NOT NULL,
    item_id INT NOT NULL,
    user_id varchar(20) NOT NULL, -- 변경 사항 
    discount DECIMAL(12, 2), -- 변경 사항
    FOREIGN KEY (item_id) REFERENCES gifticon_tbl(item_id),  -- 기프티콘테이블이랑 참조키
    FOREIGN KEY (user_id) REFERENCES user_tbl(user_id )    -- 유저테이블이랑 참조키
);

-- 신고테이블
CREATE TABLE IF NOT EXISTS report_tbl (
    report_num INT AUTO_INCREMENT PRIMARY KEY, -- 신고번호 (기본키) 자동생성
    trans_num INT NOT NULL, -- 거래번호
    report_title VARCHAR(50) NOT NULL, -- 글 제목
    report_content TEXT NOT NULL, -- 신고 내용 text로 변경
    image VARCHAR(255), -- 이미지 URL 등록 안됨
    report_status ENUM('Yes', 'No') NOT NULL DEFAULT 'No' -- 환불 여부 변경사항
);

-- 거래 테이블
CREATE TABLE IF NOT EXISTS trans_tbl (
    trans_num INT AUTO_INCREMENT PRIMARY KEY, -- 거래번호 (기본키) 자동생성
    trans_date DATETIME NOT NULL, -- 거래일자
    register_id INT NOT NULL,  -- 등록번호
    sell_id varchar(20) NOT NULL, -- 판매유저ID 변경사항
    buy_id varchar(20) NOT NULL, -- 구매유저ID 변경사항 
    FOREIGN KEY (register_id) REFERENCES sale_tbl(register_id), -- 판매테이블 참조키
    FOREIGN KEY (sell_id) REFERENCES sale_tbl(user_id), -- 판매테이블 참조키
    FOREIGN KEY (buy_id) REFERENCES user_tbl(user_id) -- 유저테이블 참조키
);


-- 정지내역 테이블

CREATE TABLE IF NOT EXISTS stop_tbl (
    stop_num INT AUTO_INCREMENT PRIMARY KEY, -- 정지번호 (기본키) 자동생성
    user_id  VARCHAR(20) NOT NULL, -- 유저ID
    trans_num INT NOT NULL, -- 거래번호
    stop_reason VARCHAR(200) NOT NULL, -- 정지사유
    stop_date datetime NOT NULL, -- 정지기간 (일 단위)
    FOREIGN KEY (user_id) REFERENCES user_tbl(user_id),
    FOREIGN KEY (trans_num) REFERENCES trans_tbl(trans_num)
);


