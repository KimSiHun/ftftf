package org.hatecouple.hate.db;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.hatecouple.hate.bean.ImageAndTitle;
import org.hatecouple.hate.bean.MovieAreaList;
import org.hatecouple.hate.bean.TheaterList;
import org.hatecouple.hate.bean.imageNameAndTheaterName;
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
		return mal;
	}
	
	public ArrayList<MovieAreaList> getMovieListAboutImglink(HttpServletRequest req,ArrayList<TheaterList> thlist) {
		
		ArrayList<MovieAreaList> mal  = new ArrayList<MovieAreaList>();
		ArrayList<imageNameAndTheaterName> inatn = new ArrayList<imageNameAndTheaterName>();
		CineMapper cm = ss.getMapper(CineMapper.class);
		String c_theaterName="";
		String c_posterName = req.getParameter("c_posterName");
		
		for (TheaterList thlis : thlist) {
			c_theaterName=thlis.getC_theaterName();
			mal.addAll(cm.selectMovieInfoAboutImg(new imageNameAndTheaterName(c_posterName,c_theaterName)));
		}
		return mal;
	}

}
