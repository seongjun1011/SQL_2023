insert into orders VALUES (1, 1, 1, 6000, TO_DATE('2023-01-10', 'yyyy-mm-dd'));
insert into orders VALUES (2, 1, 3, 21000, TO_DATE('2023-03-15', 'yyyy-mm-dd'));
insert into orders VALUES (3, 2, 5, 8000, TO_DATE('2022-02-13', 'yyyy-mm-dd'));
insert into orders VALUES (4, 3, 6, 9000, TO_DATE('2022-05-22', 'yyyy-mm-dd'));
insert into orders VALUES (5, 4, 7, 7000, TO_DATE('2021-12-30', 'yyyy-mm-dd'));
insert into orders VALUES (6, 1, 2, 15000, TO_DATE('2022-07-13', 'yyyy-mm-dd'));
insert into orders VALUES (7, 4, 8, 16000, TO_DATE('2023-10-11', 'yyyy-mm-dd'));
insert into orders VALUES (8, 3, 10, 19000, TO_DATE('2022-11-23', 'yyyy-mm-dd'));
insert into orders VALUES (9, 2, 10, 7500, TO_DATE('2021-08-15', 'yyyy-mm-dd'));
insert into orders VALUES (10,3, 8, 6600, TO_DATE('2023-06-22', 'yyyy-mm-dd'));

insert into imported_book VALUES(21, 'Zen Golf', 'Person', 12000);
insert into imported_book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

SELECT publisher, price FROM book
                        where bookname like '축구의 역사';
                        
select name, phone 
from customer 
            where name='김연아';
                                    
select * from customer 
            where name='김연아';
-- book 테이블에서 도서명과 가격을 검색하시오.
select bookname, price from book;
-- book테이블에서 가격과 도서명을 검색하시오.
select price, bookname from book;
-- book테이블에서 도서번호, 도서명, 출판사, 가격을 검색하시오.
select bookid, bookname, punlisher, price from book;
select * from book;
-- book 테이블에서 모든 출판사를 검색하시오.
select publisher from book;
-- book 테이블에서 모든 출판사를 검색하시오.(중복되는 출판사는 제거하세요)
select distinct publisher from book;

select *
from book
where price < 20000;

-- book테이블에서 가격이 10000원 이상 16000원 이하인 도서를 검색하시오
select  * 
from    book
where   price
BETWEEN 10000 AND 16000;

-- book테이블에서 가격이 10000원 이상 16000원 이하인 도서를 검색하시오
-- 단, between and를 사용하지 마시오.
select *
from book
where price >= 10000 AND price <= 16000;

-- book테이블에서 출판사가 굿스포츠, 민음사, 황금가지인 도서를 검색하시오.
-- 단 in 연산자를 사용하시오.
select * 
from book 
where publisher in ('굿스포츠', '민음사', '황금가지');

-- book테이블에서 출판사가 굿스포츠, 민음사, 황금가지인 도서를 검색하시오.
-- 단 in 연산자를 사용하지 마시오. (비교연산자와 or 연산자 사용)
select * from book 
where publisher ='굿스포츠' or publisher ='민음사' or publisher ='황금가지';

-- book테이블에서 출판사가 굿스포츠, 민음사, 황금가지인 도서를 검색하시오.
-- 단 not in 연산자를 사용하시오. 
select * from book
where publisher not in('굿스포츠', '민음사', '황금가지')

-- book테이블에서 출판사가 굿스포츠, 민음사, 황금가지인 도서를 검색하시오.
-- 단 not in 연산자를 사용하지 마시오. (비교연산자와 or 연산자 사용)
select * from book
where publisher<>'굿스포츠' and publisher<>'민음사' and publisher<>'황금가지';

-- book 테이블에서 도서명이 돈의 속성인 행을 검색하시오.
select * from book;
where bookname='돈의 속성';
like '돈의 속성';

-- book테이블에서 도서명이 속성이라는 문자열이 포함된 행을 검색하시오.
select * from book;
where bookname like '%속성%';

-- book테이블에서 도서명이 속성이라는 문자열이 포함된 행을 검색하시오.
select * from book
where bookname like '%속성%';


-- 2023-09-01 
select *
from book
where bookname like '%속성%' and price >=20000;

-- book테이블에서 속성이라는 문자열을 포함하고 도서가격이 15000원 이상인 데이터 행을 검색하시오.
select *
from book
where bookname like '%속성%' and price >=15000;

-- book테이블에서 출판사가 굿스포츠 또는 웅진지식하우스인 도서를 검색하시오.
select *
from book
where publisher='굿스포츠' or publisher='웅진지식하우스';

-- 위의 문제를 in 연산자를 사용하여 수정해 보세요.
select *
from book
where publisher in ('굿스포츠', '웅진지식하우스');

-- book테이블에서 도서명순으로 검색하ㅣ오.
select *
from book
order by bookname;

-- book테이블에서 도서번호순으로 검색하시오.
select *
from book
order by bookid;

-- book테이블에서 가격순으로 검색을 하고 같은 가격이면 이름순으로 검색하시오.
select *
from book
order by price, bookname;

-- book테이블에서 가격을 내림차순으로 검색 하고 같은 가격이면 출판사는 오름차순으로 검색하시오.
select *
from book
order by price desc, publisher ASC;

select *
from orders;
-- orders 테이블에서 고객이 주문한 도서의 총 판매액을 구하시오.
-- 집계함수 사용(함계: sum)
select sum(saleprice) as 총판매금액 from orders;

-- orders 테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매액을 구하시오.
select sum(saleprice) as 총판매금액 
from orders
where custid = 1;

-- orders 테이블에서 총판매액의 합계, 평균, 최소값, 최대값을 구하시오.
select sum(saleprice) as 총판매금액,
        avg(saleprice) as 판매액평균,
        min(saleprice) as 최저가격,
        max(saleprice) as 최대가격
from orders;

-- orders 테이블에서 판매한 도서의 개수를 구하시오.
select count(*)
from orders;

-- orders 테이블에서 도서가격이 13000원 이상인 책의 개수를 구하시오.
select count(*)
from orders
where saleprice >= 13000;

-- orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오.
select count(*)
from orders
where custid in(1,3);

-- orders 테이블에서 고객별 주문한 도서의 개수와 총합계를 구하시오.
-- 그룹화 (부분합): group by
select count(*) 주문수량, sum(saleprice) 주문총액 
from orders 
group by custid
order by custid;

-- orders 테이블에서 판매가격이 8000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총수량을 구하시오
select custid, count(*) as 도서수량 
from orders
where saleprice >=8000
group by custid
having coun(*) >= 2
order by custid;

-- 1. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
--1) 도서번호가 1인 도서의 이름
--2) 가격이 20,000원 이상인 도서의 이름
--3) 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
--4) 박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)

--1)
select * 
from book
where bookid = 1;

--2)
select *
from book
where price >= 20000;

--3)
select sum(saleprice) as 총구매액
from orders
where custid = 1;

--4)
select count(*)
from orders
where custid = 1;




-- 2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
--1) 마당서점 도서의 총 개수
--2) 마당서점에 도서를 출고하는 출판사의 총 개수
--3) 모든 고객의 이름, 주소
--4) 2021년 12월 30일~03월 15일 사이에 주문 받은 도서의 주문번호
--5) 2021년 12월 30일~03월 15일 사이에 주문 받은 도서를 제외한 도서의 주문번호
--6) 성이 '김'씨인 고객의 이름과 주소
--7) 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소

--1) 
select count(*)
from book;

--2)
select count(publisher)
from book;

--3) 
select name, address
from customer

--4) 
select orderid
from orders
where orderdate >= '2021-12-30' and orderdate <= '2023-03-15';

--5) 
select orderid
from orders
where orderdate < '2021-12-30' and orderdate > '2023-03-15';

--6)
select custid, address
from customer
where custid like '김%';

--7)
select custid, address
from customer
where custid like '김%' and name like '%아';


