-- 주문을 한 고객별 이름, 평균 구매가격을 구하시오.
select cs.name, s
from (select custid, avg(saleprice)s
from orders
group by custid)od, customer cs
where cs.custid = od.custid;

-- 고객번호가 3보다 작은 고객의 판매금액의 합계
select sum(saleprice)"total"
from orders od
where exists (select *
from customer cs
where custid <=3 and cs.custid = od.custid);

-- 고객번호가 3보다 작은 고객의 판매금액의 합계를 구하시오.

select * from book;

-- 책이름에 과학이라는 단어가 포함된 결과행을 출력하시오.
select * from book
where bookname like '%과학%';

create view v_book
as select * from book
where bookname like'%과학%';

-- 주소에 서울이라는 단어가 포함된 뷰를 생성하시오.
select * from customer
where address like '%서울%';

create view vw_customer
as select * from customer
where address like '%서울%';

select * from vw_customer;

-- 주문테이블에서 고객이름, 도서이름을 바로 확인할 수 있는 뷰를 생성한 후,
-- 김연아 고객이 구입한 도서의 주문번호, 도셔명, 주문액을 출력하시오.

create view vw_orders(orderid, name, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
    from orders o, customer c, book b
    where o.custid=c.custid and o.bookid= b.bookid;

select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name='김연아'; 

-- insertbook 프로시저 실행
exec insertbook(13, '스포츠과학', '마당과학서적', 25000);

select *from book;

exec insertorupdate(14, '스포츠 즐거움', '마당과학서적', 30000);

exec insertorupdate(14, '스포츠 즐거움', '마당과학서적', 20000);

set serveroutput on;
declare
    avergerVal number;
begin
    averagePrice(averageVal);
    dbms_output.put_line('도서평균가격: '||round(averageVal,2));
end;