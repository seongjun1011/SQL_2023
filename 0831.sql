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
                        
select name, phone from customer 
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
select * from book 
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





