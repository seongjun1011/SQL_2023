-- 도서정보 Book 테이블
create table Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);
-- 수입도서정보 Imported_Book 테이블
create table Imported_Book(
    bookid NUMBER(2),
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);
-- 고객정보 Customer 테이블
create table Customer(
    custid NUMBER(2) primary key,
    name VARCHAR2(40),
    address VARCHAR(50),
    phone VARCHAR2(20)
);
-- 주문정보 Orders 테이블
create table Orders(
    orderid NUMBER(2) primary key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);
drop table Custmer;

-- Book 테이블에 10권의 도서 정보를 추가하세요
insert into Book values(1, '축구의 역사', '굿스포츠', 7000);
insert into Book values(2, '코스모스', '사이언스북스', 8000);
insert into Book values(3, '데미안', '민음사', 17000);
insert into Book values(4, '총 균 쇠', '김영사', 16000);
insert into Book values(5, '강아지똥', '길벗어린이', 27000);
insert into Book values(6, '돈의 속성', '스노우폭스북스', 65000);
insert into Book values(7, '역행자', '웅진지식하우스', 37000);
insert into Book values(8, '건널목의 유령', '황금가지', 43000);
insert into Book values(9, '아주 희미한 빛으로도', '문학동네', 12000);
insert into Book values(10, '파친코1', '인플루엔셜', 98000);

-- Customer 테이블에 고객정보 5명 추가
insert into customer values(1, '박지성', '영국 맨체스터', '000-5000-001');
insert into customer values(2, '김연아', '서울 동작구 흑석동', '02-333-5555');
insert into customer values(3, '장미란', '서울 용산구 보광동', '02-555-7777');
insert into customer values(4, '추신수', '인천광역시 연수구', '032-233-5656');
insert into customer values(5, '박세리', '대전광역시 유성구', '042-322-123');
