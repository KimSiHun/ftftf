
-- 1. 영화관 분류
-- 영화관 번호 ex) 1 cgv 2 메가박스 3 롯데시네마 PK 
-- 영화관 이름 ex) cgv 메가박스 롯데시네마
create table cineInfo(
c_no number(2) primary key,
c_name varchar2(12 char) not null
);

-- 2. 영화관별 상영 영화
-- 영화관 이름  - 1의 이름과 join
-- 영화관 지점명 - 해당 장소 영화관 이름
-- 지점 홈페이지 url
-- 상영영화 그림
-- 상영영화 이름 - 해당 지점에서 상영하는 영화이름
-- 시간
-- 빈좌석 수
create table cineList(
c_name varchar2(12 char) not null,
c_pointName varchar2(14 char) not null,
c_url varchar2(50 char) not null,
c_img varchar2(400 char) not null,
c_proName varchar2(20 char) not null,
c_time Date not null,
c_clearChair number(4) not null
);
