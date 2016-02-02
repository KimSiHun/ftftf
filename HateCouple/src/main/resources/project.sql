
-- 1: CGV 2:Lotte 3: MegaBox

create table cineInfo(
c_no number(2) primary key,
c_name varchar2(12 char) not null
);



-- c_movie_title
-- c_name 영화관 이름
-- c_cine_location 영화관 위치 (ex: 수원, 목동, 코엑스)
-- c_date 상영날짜 (ex: 1/30, 2/1)
-- c_room_no  (ex: 2관,3관)
-- c_current_time 현재 시간
-- c_moive_title 영화 제목
-- c_begin_time 시작시간 
-- c_runtime  상영시간
-- c_clearSeat  빈좌석
-- c_poster_img 포스터 이미지

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

insert into CINELIST values ('레버넌트', 'CGV', '왕십리', '2/2', 'Imax', sysdate, '23:00', 158, 99,'http://movie.phinf.naver.net/20151229_126/14513737252567fehq_JPEG/movie_image.jpg');




