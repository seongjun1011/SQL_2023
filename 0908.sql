-- ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�
select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�
select name, address
from customer cs
where exists (select *
              from orders od
              where cs.custid=od.custid);
              
-- ���տ�����: ������ (UNION) , ������ (MINUS) , ������ (INTERSECT)
-- ������ ������ ���
-- ������ �ֹ����� ���� ���� �̐a�� ���ÿ�.
select name
from customer;

select distinct custid 
from orders;

select name
from customer
where custid in(select custid from orders);

-- ������ ������ ����� ���
select name from customer
minus
select name from customer
where custid in(select distinct custid from orders);

-- ������ ������ ������� ���� ���
select name 
from customer
where custid not in(select distinct custid from orders);

-- EXISTS: ���������� ����� �����ϴ� ��쿡 true
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.
select name, address
from customer
where custid in(select distinct custid from orders);
-- �������ΰ� �ߺ��� ������ ���
select name, address
from customer c, orders o
where c.custid = o.custid;

-- Exists ����� ���
select name, address
from customer c
where exists(select * from orders o
                      where c.custid = o.custid);
                      
-- 1. ���缭���� ���� �䱸�ϴ� ���� ������ ���� SQL���� �ۼ��Ͻÿ�.
-- 5) �������� ������ ������ ���ǻ� ��
select count(distinct publisher)
from book b
where b.bookid in(select bookid from orders o, customer c 
where o.custid = c.custid and c.name ='������');

-- 6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname,price,price - salepric 
from book b, orders o, customer c
where b.bookid = o.bookid and o.custid = c.custid and c.custname = '������';

-- 7) �������� �������� ���� ������ �̸�
select bookname
from book,customer,orders
where customer.custid = orders.custid
and orders.bookid = book.bookid
and customer.name = '������';

-- 2. ���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�.
-- 8) �ֹ����� ���� ���� �̸�(�μ����� ���)
select name 
from customer
where custid not in(select custid from orders);

-- 9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice), avg(saleprice)
from orders;

-- 10) ���� �̸��� ���� ���ž�
select customer.name, sum(orders.saleprice)
from orders, customer
where orders.custid=customer.custid
group by customer.name;

-- 11) ���� �̸��� ���� ������ ���� ���
select name, bookname
from book, orders, customer
where (orders.bookid=book.bookid) and (orders.custid=customer.custid);

-- 12) ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
select * from book b, orders o
where b.bookid = o.bookid
and price-saleprice=(salect max(price-saleprice)
                                from book sb, orders so
                                where sb.bookid=so.bookid);

-- 13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
                        

-- DDL (Data Defination Language): ������ ���Ǿ�
-- create table/alter table/drop table
-- ���̺� ���� ����1
create table newbook1 (
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- ���̺� ���� ����2
-- primary key ���� ��� 1
create table newbook2 (
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key (bookid)
);

-- primary key ���� ��� 2
create table newbook3 (
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
    );


-- bookname �÷�: null�� ���� �� ����
-- publisher �÷�: ������ ���� ���� �� ����
-- price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000�����ϰ� �Էµ� ���� 1000�ʰ��� ��
-- bookname, publisher �÷��� ����Ű�� ����

create table newbook4 (
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price > 1000),
    primary key(bookname, publisher)
);









