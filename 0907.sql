--1) ���缭�� ������ �� ����
select count(*)
from book;

--2) ���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher)
from book;

--3) ��� ���� �̸�, �ּ�
select name, address
from customer

--4) 2021�� 12�� 30��~03�� 15�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid
from orders
BETWEEN orderdate >= '2021-12-30' and orderdate <= '2023-03-15';

--5) 2021�� 12�� 30��~03�� 15�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
select orderid
from orders
BETWEEN orderdate < '2021-12-30' and orderdate > '2023-03-15';

--6) ���� '��'���� ���� �̸��� �ּ�
select name, address
from customer
where name like '��%';

--7) ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name, address
from customer
where name like '��%' and name like '%��';

--  �������� (Equi Join)
-- �������� ���̺��� ������ �� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���

-- ���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
select * from customer, orders
where customer.custid = orders.custid

-- ���� ���� �ֹ��� ���� �����͸� ��� ����ȣ������ ����Ͻÿ�
select *
from custmer, orders
where customer.custid = orders.custid
order by customer.custid desc;

-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�
select name, saleprice
from customer, orders
where customer.custid = orders.custid;

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�
select name, sum(saleprice)
from customer, orders
where customer.custid = orders.custid
group by name
order by name

-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�
selet customer.name, book.bookname
from customer, orders, book
where customer.custid=orders,.custid AND orders.bookid=book.bookid;

-- ������ 16,000���� ������ �ֹ��� ���̸��� �����̸��� ����Ͻÿ�
select name, bookname
from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and price = 16000;

-- �ܺ�����(Outer Join)
-- ���������� �ϰԵǸ� ���� �������� ���� ���� ���õ�����
-- �ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� ���� �������� ���� ������ �൵ �����ؼ� ������ش�. 

-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
select customer.name, saleprice
from customer left outer join orders
            on customer.custid=orders.custid;
            
-- Sub Query(�μ� ����)
-- Main Query ���� �ִ� Query

-- �����̸�
select bookname from book;
-- ���������� ���� ��� �����̸��� ����Ͻÿ�.
select bookname from book
where price=(select max(price) from book);

-- ���������� ���� �� ������ �̸��� ������ ����Ͻÿ�
select bookname, price
from book
where price =(select min(price) from book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
select name from customer
where custid in (select distinct custid from orders);
-- sub query: �ֹ��� ���� �ִ� ����ȣ��
select distinct custid from orders;

-- ���������Ͽ콺���� ������ ������ ������ ���� �̸��� ����Ͻÿ�.
select name from customer;
select bookid, bookname from book
where publisher='���������Ͽ콺';
--������ ������ ����� ����ȣ
select distinct custid from orders;

select name from customer
where custid in (select distinct custid from orders
                where bookid in(select bookid from book
                                where publisher='���������Ͽ콺'));

            






