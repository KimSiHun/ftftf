
-- 1: CGV 2:Lotte 3: MegaBox

create table cineInfo(
c_no number(2) primary key,
c_name varchar2(12 char) not null
);



-- c_movie_title
-- c_name ��ȭ�� �̸�
-- c_cine_location ��ȭ�� ��ġ (ex: ����, ��, �ڿ���)
-- c_date �󿵳�¥ (ex: 1/30, 2/1)
-- c_room_no  (ex: 2��,3��)
-- c_current_time ���� �ð�
-- c_moive_title ��ȭ ����
-- c_begin_time ���۽ð� 
-- c_runtime  �󿵽ð�
-- c_clearSeat  ���¼�
-- c_poster_img ������ �̹���

create table cineList(
c_movie_title varchar2(30 char) not null,
c_name varchar2(12 char) not null,
c_cine_location varchar2(20 char) not null,
c_date varchar2(30 char) not null,
c_room_no varchar2(10 char) not null,
c_current_time Date not null,
c_begin_time varchar2(5 char) not null, 
c_runtime number (4) not null,
c_clearSeat number (4) not null,
c_poster_img varchar2(1000 char) not null 
);

drop table cineList;

select * from cineinfo;

insert into cineinfo values(3, 'MegaBox');

select * from CINELIST;

insert into CINELIST values ('������Ʈ', 'CGV', '�սʸ�', '2/2', 'Imax', sysdate, '23:00', 158, 99,'http://movie.phinf.naver.net/20151229_126/14513737252567fehq_JPEG/movie_image.jpg');




