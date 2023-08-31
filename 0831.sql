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
                        
select name, phone from customer 
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
select * from book 
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





