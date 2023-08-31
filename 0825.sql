-- �������� Book ���̺�
create table Book(
    bookid NUMBER(2) primary key,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);
-- ���Ե������� Imported_Book ���̺�
create table Imported_Book(
    bookid NUMBER(2),
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);
-- ������ Customer ���̺�
create table Customer(
    custid NUMBER(2) primary key,
    name VARCHAR2(40),
    address VARCHAR(50),
    phone VARCHAR2(20)
);
-- �ֹ����� Orders ���̺�
create table Orders(
    orderid NUMBER(2) primary key,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);
drop table Custmer;

-- Book ���̺� 10���� ���� ������ �߰��ϼ���
insert into Book values(1, '�౸�� ����', '�½�����', 7000);
insert into Book values(2, '�ڽ���', '���̾𽺺Ͻ�', 8000);
insert into Book values(3, '���̾�', '������', 17000);
insert into Book values(4, '�� �� ��', '�迵��', 16000);
insert into Book values(5, '��������', '������', 27000);
insert into Book values(6, '���� �Ӽ�', '����������Ͻ�', 65000);
insert into Book values(7, '������', '���������Ͽ콺', 37000);
insert into Book values(8, '�ǳθ��� ����', 'Ȳ�ݰ���', 43000);
insert into Book values(9, '���� ����� �����ε�', '���е���', 12000);
insert into Book values(10, '��ģ��1', '���÷翣��', 98000);

-- Customer ���̺� ������ 5�� �߰�
insert into customer values(1, '������', '���� ��ü����', '000-5000-001');
insert into customer values(2, '�迬��', '���� ���۱� �漮��', '02-333-5555');
insert into customer values(3, '��̶�', '���� ��걸 ������', '02-555-7777');
insert into customer values(4, '�߽ż�', '��õ������ ������', '032-233-5656');
insert into customer values(5, '�ڼ���', '���������� ������', '042-322-123');
