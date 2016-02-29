package org.hatecouple.hate.db;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.hatecouple.hate.bean.ImageAndTitle;
import org.hatecouple.hate.bean.MovieAreaList;
import org.hatecouple.hate.bean.TheaterList;
import org.hatecouple.hate.bean.imageNameAndTheaterName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
public class DBDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	private DataSourceTransactionManager DSTM;

	public ArrayList<ImageAndTitle> getMovieInArea(ArrayList<TheaterList> thlist) {
		// 선언한 트랜잭션을 사용하겠다고 명시
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = DSTM.getTransaction(def);

		ArrayList<ImageAndTitle> mal = new ArrayList<ImageAndTitle>();
		// Mapper 연결
		CineMapper cm = ss.getMapper(CineMapper.class);
		try {
			for (TheaterList thlis : thlist) {
			
				mal.addAll(cm.selectAreaMovieImg(new MovieAreaList(thlis.getC_theaterName(), null, null, null)));
			}
			DSTM.commit(status);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			DSTM.rollback(status);
		}
		return mal;
	}

	public ArrayList<MovieAreaList> getMovieListAboutImglink(HttpServletRequest req) {
		// 선언한 트랜잭션을 사용하겠다고 명시
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = DSTM.getTransaction(def);
		
		HttpSession session = req.getSession();
		ArrayList<TheaterList> thlist = (ArrayList<TheaterList>)session.getAttribute("list");
		
		ArrayList<MovieAreaList> mal = new ArrayList<MovieAreaList>();

		CineMapper cm = ss.getMapper(CineMapper.class);
		
		String c_posterName = req.getParameter("c_posterName");

		try {
			for (TheaterList thlis : thlist) {
				mal.addAll(cm.selectMovieInfoAboutImg(new imageNameAndTheaterName(c_posterName, thlis.getC_theaterName())));
			}
			DSTM.commit(status);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			DSTM.rollback(status);
		}
		return mal;
	}

}
