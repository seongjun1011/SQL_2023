-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름을 출력하시오.

-- 박지성이 구매한 도서의 출판사이름을 출력하시오.
select publisher from customer cs, orders os, book bs
where cs.custid=os.custid and os.bookid=bs.bookid
and name like '박지성';

select name 
from customer cs, orders os, book bs
where cs.custid=os.custid and os.bookid=bs.bookid
and name not like '박지성'
and publisher in(
    select publisher from customer cs, orders os, book bs
    where cs.custid=os.custid and os.bookid=bs.bookid
    and name like '박지성'
);

-- 고객의 30% 이상이 구매한 도서명을 출력하시오

select bookname from book bm
where (select count(b.bookid) from book b, orders o
        where b.bookid=o.bookid and b.bookid=bm.bookid)
        >= (select count(*) from customer) *0.3;
        
-- 새로운도서 ('스포츠 세계', '대한미디어', 10000원)이  마당서점에 입고되었다.
-- 데이터 행을 추가하시오.
-- 만약 삽입이 되지 않는다면 부족한 데이터가 있는지 확인해 본다.
insert into book values(11, '스포츠 세계', '대한미디어',10000);

-- '데이원'에서 출판한 도서를 삭제하시오.
delete from book
where punlisher='데이원';

select * from book;

-- '해냄'에서 출판한 돗를 삭제하시오.
-- 만약 삭제되지 않는다면 오류메시지를 확인해 보세요.
delete from book
where publisher like '해냄';
-- 무결성 제약조건이 위배되었습니다- orders 테이블의 자식 레코드가 발견되었습니다
-- 따라서 '해냄'출판사의 도서정보는 삭제할 수 없다.

-- 출판사'대한미디어'를 '대한출판사'로 이름을 변경하시오.
update book set publisher='대한출판사'
where publisher like '대한미디어';

-- abs: 절대값구하는 함수
select abs(-33), abs(33) from dual;

-- 5.647을 소수 첫째자리까지 반올림한 값을 구하시오.
select round(5.647, 1) from dual;

-- 고객별 평균 주문금액을 백원 단위로 반올림한 값을 구하시오.
select custid "고객번호", round(avg(saleprice), -2) "평균금액"
from orders
group by custid;

-- 도서명에 '과학'이 포함된 도서를 '수학'으로 변경하여 출력하시오.
-- 실제 book테이블의 원본데이터를 변경하면 안됩니다.
select bookid, replace(bookname, '과학', '수학') bookname, publisher, price
from book;

-- 출판사가 '해냄'인 도서명으 글자수와 바이트수를 출력하시오.
select bookname "도서명", length(bookname) 글자수, lengthb(bookname) 바이트수
from book
where publisher like '해냄';

-- 고객 중에서 같은 성씨를 가진 사람이 몇명인지 성씨별 인원수를 출력하시오.
select substr(name, 1, 1) "성씨", count(*) "인원수"
from customer
group by substr(name, 1, 1);

-- 서점의 주문확정일은 주문일로부터 10일후이다. 주번번호, 주문일, 주문확정일을 출력하시오.
select orderid 주문번호, orderdate 주문일, orderdate+10 주문확정일
from orders order by orderid;

-- 2022년 2월 13일에 주문받은 주문번호, 주문일, 고객번호, 도서번호를 모두 출력하시오.
-- 단, 주문일은 "yyyy년 mm월 dd일"과 같은 format으로 표시하시오.
select orderid 주문번호, orderdate 주문일, custid 고객번호, bookid 도서번호
from orders
where orderdate=to_date('20220213', 'yyyymmdd');

-- 2022년 2월 13일에 주문받은 주문번호, 주문일, 고객번호, 도서번호를 모두 출력하시오.
-- 단, 주문일은 "yyyy-mm-dd일"과 같은 format으로 표시하시오.
select orderid 주문번호, to_char(orderdate, 'yyyy-mm-dd') 주문일, name 고객명, bookname 도서명
from orders o, customer c, book b
where c.custid=o.custid and b.bookid = o.bookid
and orderdate=to_date('20220213', 'yyyymmdd');

-- DB 서버의 설정된 날짜와 시간 요일을 출력하시오.
-- 실제 반환된 날짜와 형식을 지정한(년도4자리/월2자리/날짜2자리 간략한 요일, 시:분:초) 날짜와 시간 2가지를 모두 출력하시오.

select sysdate 원래반환된값, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') 지정형식날짜및시간 from dual;


