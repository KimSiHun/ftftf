select cgvimagentitle.c_movieName , cgvimagentitle.c_posterName from cgvimagentitle, (select c_movieName from cgvmovielist where c_theaterName='CGV강남점') areaInfo  where cgvimagentitle.c_moviename=areaInfo.c_moviename

select cgvmovielist.c_moviename from CGVMOVIELIST where c_theatercode='0056'


select * from (select areaInfo.c_theaterName, areaInfo.c_movieName, areaInfo.c_movieTime, areaInfo.c_clearchair, cgvimagentitle.c_posterName from cgvimagentitle, (select c_theaterName,c_movieName,c_movieTime,c_clearchair from cgvmovielist where c_theatercode='0056') areaInfo  where cgvimagentitle.c_moviename=areaInfo.c_moviename)


select cgvimagentitle.c_movieName , cgvimagentitle.c_posterName from cgvimagentitle, (select c_movieName from cgvmovielist where c_theaterName='CGV강남점') areaInfo  where cgvimagentitle.c_moviename=areaInfo.c_moviename