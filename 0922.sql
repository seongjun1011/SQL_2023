select length('Birthday')
from dual;

-- ���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�.(��, ��ȭ��ȣ�� ���� ���� ����ó �������� ����Ͻÿ�.
select name �̸�, phone ��ȭ��ȣ
from customer;
select name �̸�, nvl(phone, '����ó����')
from customer;

-- ����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� ���� �θ� ����Ͻÿ�
select rownum ���� , custid ����ȣ, name �̸�, phone ��ȭ��ȣ
from customer;
select rownum ���� , custid ����ȣ, name �̸�, phone ��ȭ��ȣ
from customer
where rownum<=2;

-- mybook ���̺� ����
create table mybook(
    bookid number not null primary key, 
    price number
);

-- ������ �� ����
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

-- ����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders;
where saleprice <= (select avg(saleprice) from orders);

-- �� ���� ����ĸűݾ׺��� ū �ݾ���  �ֹ� ���������ؼ��� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders mo
where saleprice >(select avg(saleprice) 
from orders so 
where mo.custid=so.custid);

-- ���￡ �����ϴ� �E������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.
select sum(saleprice) ���Ǹűݾ�
from orders;

-- ���￡ �����ϴ� ����� ����ȣ
select custid 
from customer
where address like '%����';

select sum(saleprice) ���Ǹűݾ�
from orders
where custid in(select custid from customer
whrere address like '%����');

-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders;
select saleprice 
from orders 
where custid=3;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders
where saleprice > all(select saleprice from orders where custid=3);

-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.(��, exist������ ���)
select sum(saleprice) ���Ǹűݾ�
from orders mo
where exists(
    select * from customer c
    where address like '%����%' and mo.custid=c.custid
);

-- ���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����ȣ, �Ǹ��հ�)
select custid ����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

-- ���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����, �Ǹ��հ�)
select (select name from customer c
        where c.custid=o.custid) ����, sum(saleprice) �Ǹ��հ� from orders o
group by o.custid;

-- �ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid);

-- ����ȣ�� 2������ ����ȣ�� �̸��� ����Ͻÿ�.
select custid ����ȣ, name �̸� from customer
where custid<=2;

-- ����ȣ�� 2������ ���� �Ǹűݾ��� ����Ͻÿ�.*���̸��� ���� �Ǹž� ���)
select name ���̸�, sum(saleprice) �Ǹ��հ�
from (select custid ����ȣ, name �̸� from customer
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

-- �ֹ����� �ֹ���ȣ, �ּ�, ������ ������ ��Ÿ���� sql���̴�