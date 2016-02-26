package org.hatecouple.hate.db;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.hatecouple.hate.HomeController;
import org.hatecouple.hate.bean.ImageAndTitle;
import org.hatecouple.hate.bean.MovieAreaList;
import org.hatecouple.hate.bean.TheaterList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DBDAO {
	
	@Autowired
	private SqlSession ss;
	
	public ArrayList<ImageAndTitle> getMovieInArea(ArrayList<TheaterList> thlist) {
		
		ArrayList<ImageAndTitle> mal = new ArrayList<ImageAndTitle>();
		
		// Mapper 연결
		CineMapper cm = ss.getMapper(CineMapper.class);
		
		String c_theaterName = "";
		// 파라미터 값 받기.
		
		// List select 후 리턴 // 예가 for문 추가해서 여러개 골라내는 용입니다.!
		for (TheaterList thlis : thlist) {			
			c_theaterName = thlis.getC_theaterName();
			mal.addAll(cm.selectAreaMovieImg(new MovieAreaList(c_theaterName, null, null, null)));
		}
		
		for (ImageAndTitle imageAndTitle : mal) {
			System.out.println(imageAndTitle.getC_movieName() + " / "  + imageAndTitle.getC_posterName());
		}
		
		return mal;
	}
	
}
