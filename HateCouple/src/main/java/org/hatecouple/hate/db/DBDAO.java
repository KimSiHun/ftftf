package org.hatecouple.hate.db;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.hatecouple.hate.bean.MovieAreaList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DBDAO {

	@Autowired
	private SqlSession ss;

//	public Movies getMovie() {
//
//		CineMapper cm = ss.getMapper(CineMapper.class);
//
//		return new Movies(cm.getMovie());
//
//	}
	
	public ArrayList<MovieAreaList> getMovieInArea(HttpServletRequest req) {
		
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 파라미터 값 받기.
		String c_theaterName = req.getParameter("c_theaterName");
		
		// Mapper 연결
		System.out.println(c_theaterName);
		CineMapper cm = ss.getMapper(CineMapper.class);
		
		// List select 후 리턴
		ArrayList<MovieAreaList> mal = cm.getMovieInArea( new MovieAreaList(c_theaterName, null, null, null));
		
		for (int i = 0; i < mal.size(); i++) {
			System.out.println(mal.get(i).getC_theaterName()+" / "+mal.get(i).getC_movieName());
		}
		
		return mal;
	}
	

}
