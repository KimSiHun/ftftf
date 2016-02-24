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

	// "getMV": to get whole movieList as JSON
	@RequestMapping(value = "/getMV", method = RequestMethod.GET)
	public @ResponseBody Movies getMovie() {

		return d.getMovie();
	}

	// temporary method for slide_area
	@RequestMapping(value = "/movieMain", method = RequestMethod.GET)
	public String slide() {

		return "movieMain";
	}

	@RequestMapping(value = "/mnlTest", method = RequestMethod.GET)
	public String mnlTest() {

		return "mapAndList";
	}

	// @RequestMapping(value = "/jsonp", method = RequestMethod.GET)
	// public @ResponseBody String getJSONP(
	// @RequestParam(value = "callback") String cb){
	// try{
	// Movies m = d.getMovie();
	// ObjectMapper om = new ObjectMapper();
	// String res = cb + "(" + new String(om.writeValueAsBytes(m), "8859_1") +
	// ")";
	// return res;
	// } catch(Exception e){
	// e.printStackTrace();
	// return null;
	// }
	// }

}
