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
	
	@RequestMapping(value = "/getMovie", method = RequestMethod.GET)
	public @ResponseBody Movies getMovie() {
	
		return d.getMovie();
	}
	
}
