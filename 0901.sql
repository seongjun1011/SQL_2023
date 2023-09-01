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
                        where bookname like '�౸�� ����';
                        
select name, phone 
from customer 
            where name='�迬��';
                                    
select * from customer 
            where name='�迬��';
-- book ���̺��� ������� ������ �˻��Ͻÿ�.
select bookname, price from book;
-- book���̺��� ���ݰ� �������� �˻��Ͻÿ�.
select price, bookname from book;
-- book���̺��� ������ȣ, ������, ���ǻ�, ������ �˻��Ͻÿ�.
select bookid, bookname, punlisher, price from book;
select * from book;
-- book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.
select publisher from book;
-- book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.(�ߺ��Ǵ� ���ǻ�� �����ϼ���)
select distinct publisher from book;

select *
from book
where price < 20000;

-- book���̺��� ������ 10000�� �̻� 16000�� ������ ������ �˻��Ͻÿ�
select  * 
from    book
where   price
BETWEEN 10000 AND 16000;

-- book���̺��� ������ 10000�� �̻� 16000�� ������ ������ �˻��Ͻÿ�
-- ��, between and�� ������� ���ÿ�.
select *
from book
where price >= 10000 AND price <= 16000;

-- book���̺��� ���ǻ簡 �½�����, ������, Ȳ�ݰ����� ������ �˻��Ͻÿ�.
-- �� in �����ڸ� ����Ͻÿ�.
select * 
from book 
where publisher in ('�½�����', '������', 'Ȳ�ݰ���');

-- book���̺��� ���ǻ簡 �½�����, ������, Ȳ�ݰ����� ������ �˻��Ͻÿ�.
-- �� in �����ڸ� ������� ���ÿ�. (�񱳿����ڿ� or ������ ���)
select * from book 
where publisher ='�½�����' or publisher ='������' or publisher ='Ȳ�ݰ���';

-- book���̺��� ���ǻ簡 �½�����, ������, Ȳ�ݰ����� ������ �˻��Ͻÿ�.
-- �� not in �����ڸ� ����Ͻÿ�. 
select * from book
where publisher not in('�½�����', '������', 'Ȳ�ݰ���')

-- book���̺��� ���ǻ簡 �½�����, ������, Ȳ�ݰ����� ������ �˻��Ͻÿ�.
-- �� not in �����ڸ� ������� ���ÿ�. (�񱳿����ڿ� or ������ ���)
select * from book
where publisher<>'�½�����' and publisher<>'������' and publisher<>'Ȳ�ݰ���';

-- book ���̺��� �������� ���� �Ӽ��� ���� �˻��Ͻÿ�.
select * from book;
where bookname='���� �Ӽ�';
like '���� �Ӽ�';

-- book���̺��� �������� �Ӽ��̶�� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�.
select * from book;
where bookname like '%�Ӽ�%';

-- book���̺��� �������� �Ӽ��̶�� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�.
select * from book
where bookname like '%�Ӽ�%';


-- 2023-09-01 
select *
from book
where bookname like '%�Ӽ�%' and price >=20000;

-- book���̺��� �Ӽ��̶�� ���ڿ��� �����ϰ� ���������� 15000�� �̻��� ������ ���� �˻��Ͻÿ�.
select *
from book
where bookname like '%�Ӽ�%' and price >=15000;

-- book���̺��� ���ǻ簡 �½����� �Ǵ� ���������Ͽ콺�� ������ �˻��Ͻÿ�.
select *
from book
where publisher='�½�����' or publisher='���������Ͽ콺';

-- ���� ������ in �����ڸ� ����Ͽ� ������ ������.
select *
from book
where publisher in ('�½�����', '���������Ͽ콺');

-- book���̺��� ����������� �˻��Ϥӿ�.
select *
from book
order by bookname;

-- book���̺��� ������ȣ������ �˻��Ͻÿ�.
select *
from book
order by bookid;

-- book���̺��� ���ݼ����� �˻��� �ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�.
select *
from book
order by price, bookname;

-- book���̺��� ������ ������������ �˻� �ϰ� ���� �����̸� ���ǻ�� ������������ �˻��Ͻÿ�.
select *
from book
order by price desc, publisher ASC;

select *
from orders;
-- orders ���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
-- �����Լ� ���(�԰�: sum)
select sum(saleprice) as ���Ǹűݾ� from orders;

-- orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ� 
from orders
where custid = 1;

-- orders ���̺��� ���Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�.
select sum(saleprice) as ���Ǹűݾ�,
        avg(saleprice) as �Ǹž����,
        min(saleprice) as ��������,
        max(saleprice) as �ִ밡��
from orders;

-- orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�.
select count(*)
from orders;

-- orders ���̺��� ���������� 13000�� �̻��� å�� ������ ���Ͻÿ�.
select count(*)
from orders
where saleprice >= 13000;

-- orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�.
select count(*)
from orders
where custid in(1,3);

-- orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�.
-- �׷�ȭ (�κ���): group by
select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� 
from orders 
group by custid
order by custid;

-- orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� �ֹ� ������ �Ѽ����� ���Ͻÿ�
select custid, count(*) as �������� 
from orders
where saleprice >=8000
group by custid
having coun(*) >= 2
order by custid;

-- 1. ���缭���� ���� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�.
--1) ������ȣ�� 1�� ������ �̸�
--2) ������ 20,000�� �̻��� ������ �̸�
--3) �������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
--4) �������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�)

--1)
select * 
from book
where bookid = 1;

--2)
select *
from book
where price >= 20000;

--3)
select sum(saleprice) as �ѱ��ž�
from orders
where custid = 1;

--4)
select count(*)
from orders
where custid = 1;




-- 2. ���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�.
--1) ���缭�� ������ �� ����
--2) ���缭���� ������ ����ϴ� ���ǻ��� �� ����
--3) ��� ���� �̸�, �ּ�
--4) 2021�� 12�� 30��~03�� 15�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
--5) 2021�� 12�� 30��~03�� 15�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
--6) ���� '��'���� ���� �̸��� �ּ�
--7) ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�

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
where custid like '��%';

--7)
select custid, address
from customer
where custid like '��%' and name like '%��';


