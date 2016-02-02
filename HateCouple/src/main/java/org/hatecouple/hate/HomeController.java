package org.hatecouple.hate;

import org.hatecouple.hate.bean.Movies;
import org.hatecouple.hate.db.DBDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class HomeController {
	
	@Autowired
	private DBDAO d;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		return "index";
	}
	
	// "getMV" 영화 전체 정보를 가져오는 주소
	@RequestMapping(value = "/getMV", method = RequestMethod.GET)
	public @ResponseBody Movies getMovie() {
	
		return d.getMovie();
	}
	
	// slide바 테스트를 위한 임시 메소드 입니다.
	@RequestMapping(value = "/slide", method = RequestMethod.GET)
	public String slide() {
	
		return "slide_area";
	}
	
}
