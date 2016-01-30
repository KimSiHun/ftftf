package org.hatecouple.hate.db;

import org.apache.ibatis.session.SqlSession;
import org.hatecouple.hate.bean.Movies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DBDAO {

	@Autowired
	private SqlSession ss;

	public Movies getMovie() {

		CineMapper cm = ss.getMapper(CineMapper.class);

		return new Movies(cm.getMovie());

	}

}
