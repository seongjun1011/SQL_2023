select length('Birthday')
from dual;

-- 고객의 이름과 전화번호를 출력하시오.(단, 전화번호가 없는 고객은 연락처 없음으로 출력하시오.
select name 이름, phone 전화번호
from customer;
select name 이름, nvl(phone, '연락처없음')
from customer;

-- 고객목록에서 순번, 고객번호, 이름, 전화번호를 앞의 두명만 출력하시오
select rownum 순번 , custid 고객번호, name 이름, phone 전화번호
from customer;
select rownum 순번 , custid 고객번호, name 이름, phone 전화번호
from customer
where rownum<=2;

-- mybook 테이블 생성
create table mybook(
    bookid number not null primary key, 
    price number
);

-- 데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

-- (1)
select *
from mybook;

-- (2)
select bookid, nvl(price, 0)
from mybook;

- (3)
select *
from mybook
where price is null;

-- (4)
select *
from mybook;
where price='';

-- (5)
select bookid, price+100
from mybook;

-- (6)
select sum(price), avg(price), count(*)
from mybook
where bookid >= 4;

-- (7)
select count(*), count(price)
from mybook;

-- (8)
select sum(price), avg(price)
from mybook;

-- 평균판매금액 이하의 주문에 대해 주문번호와 판매금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액
from orders;

select orderid 주문번호, saleprice 판매금액
from orders;
where saleprice <= (select avg(saleprice) from orders);

-- 각 고객의 평균파매금액보다 큰 금액의  주문 내역에대해서만 주문번호, 고객번호, 판매금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액
from orders;

select orderid 주문번호, saleprice 판매금액
from orders mo
where saleprice >(select avg(saleprice) 
from orders so 
where mo.custid=so.custid);

-- 서울에 거주하는 괙ㄱ에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매금액
from orders;

-- 서울에 거주하는 사람의 고객번호
select custid 
from customer
where address like '%서울';

select sum(saleprice) 총판매금액
from orders
where custid in(select custid from customer
whrere address like '%서울');

-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액
from orders;
select saleprice 
from orders 
where custid=3;

select orderid 주문번호, saleprice 판매금액
from orders
where saleprice > all(select saleprice from orders where custid=3);

-- 서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오.(단, exist연산자 사용)
select sum(saleprice) 총판매금액
from orders mo
where exists(
    select * from customer c
    where address like '%서울%' and mo.custid=c.custid
);

-- 고객별 판매금액의 합계를 출력하시오.(고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

-- 고객별 판매금액의 합계를 출력하시오.(고객명, 판매합계)
select (select name from customer c
        where c.custid=o.custid) 고객명, sum(saleprice) 판매합계 from orders o
group by o.custid;

-- 주무목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid);

-- 고객번호가 2이하인 고객번호와 이름을 출력하시오.
select custid 고객번호, name 이름 from customer
where custid<=2;

-- 고객번호가 2이하인 고객의 판매금액을 출력하시오.*고객이름과 고객별 판매액 출력)
select name 고객이름, sum(saleprice) 판매합계
from (select custid 고객번호, name 이름 from customer
        where custid<=2) c, orders o
where c.custid=o.custid
group by name;

-- 5.(1)
select custid, (select address
                from customer cs
                where cs.custid = od.custid)"address",
                sum(saleprice)"total"
from    orders od
group by    od.custid;

-- 주문고객의 주문번호, 주소, 구매한 총합을 나타내는 sql문이다