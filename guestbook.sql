--방명록 시퀀스 삭제
drop sequence seq_guestbook_no;

--방명록 테이블삭제
drop table guestbook;

--방명록 테이블 생성
create table guestbook (
    no number,
    name varchar2(80),
    password varchar2(20),
    content varchar2(2000),
    reg_date date,
    primary key(no)
);

--방명록 시퀀스 생성
create sequence seq_guestbook_no
increment by 1 
start with 1
nocache;

insert into guestbook
values(seq_guestbook_no.nextval, '황일영', '1234', '황일영방문했습니다.', sysdate);

insert into guestbook
values(seq_guestbook_no.nextval, '정우성', '1234', '정우성방문했습니다.', sysdate);

select *
from guestbook;

--전체 리스트
select no,
       name,
       password,
       content,
       to_char(reg_date, 'yyyy-mm-dd hh:mi:ss') reg_date
       from guestbook
order by reg_date desc;

commit;