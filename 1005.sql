-- �ֹ��� �� ���� �̸�, ��� ���Ű����� ���Ͻÿ�.
select cs.name, s
from (select custid, avg(saleprice)s
from orders
group by custid)od, customer cs
where cs.custid = od.custid;

-- ����ȣ�� 3���� ���� ���� �Ǹűݾ��� �հ�
select sum(saleprice)"total"
from orders od
where exists (select *
from customer cs
where custid <=3 and cs.custid = od.custid);

-- ����ȣ�� 3���� ���� ���� �Ǹűݾ��� �հ踦 ���Ͻÿ�.

select * from book;

-- å�̸��� �����̶�� �ܾ ���Ե� ������� ����Ͻÿ�.
select * from book
where bookname like '%����%';

create view v_book
as select * from book
where bookname like'%����%';

-- �ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�.
select * from customer
where address like '%����%';

create view vw_customer
as select * from customer
where address like '%����%';

select * from vw_customer;

-- �ֹ����̺��� ���̸�, �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��,
-- �迬�� ���� ������ ������ �ֹ���ȣ, ���Ÿ�, �ֹ����� ����Ͻÿ�.

create view vw_orders(orderid, name, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid, o.custid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
    from orders o, customer c, book b
    where o.custid=c.custid and o.bookid= b.bookid;

select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name='�迬��'; 

-- insertbook ���ν��� ����
exec insertbook(13, '����������', '������м���', 25000);

select *from book;

exec insertorupdate(14, '������ ��ſ�', '������м���', 30000);

exec insertorupdate(14, '������ ��ſ�', '������м���', 20000);

set serveroutput on;
declare
    avergerVal number;
begin
    averagePrice(averageVal);
    dbms_output.put_line('������հ���: '||round(averageVal,2));
end;