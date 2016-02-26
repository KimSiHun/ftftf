package org.hatecouple.hate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.hatecouple.hate.bean.ImageAndTitle;
import org.hatecouple.hate.bean.MovieAreaList;
import org.hatecouple.hate.bean.TheaterList;
import org.hatecouple.hate.db.DBDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	// @RequestMapping(value = "/getMV", method = RequestMethod.GET)
	// public @ResponseBody Movies getMovie() {
	//
	// return d.getMovie();
	// }

	// temporary method for slide_area
	@RequestMapping(value = "/movieMain", method = RequestMethod.GET)
	public String slide() {

		return "movieMain";
	}

	@RequestMapping(value = "/mnlTest", method = RequestMethod.GET)
	public String mnlTest() {

		return "mapAndList";
	}

	@RequestMapping(value = "/getAreaDB", method = RequestMethod.GET)
	public String getAreaDB(HttpServletRequest req) {

		return "index";
	}

	@RequestMapping("/abc")
	@ResponseBody
	public ArrayList<ImageAndTitle> getClientList(@RequestBody List<Map<String, Object>> list) {

		ArrayList<TheaterList> thList = new ArrayList<TheaterList>();

		for (Map<String, Object> t : list) {

			TheaterList th = new TheaterList();
			th.setC_theaterName(t.get("c_theaterName").toString());

			thList.add(th);
		}
		System.out.println(d.getMovieInArea(thList).get(0).toString());
		return d.getMovieInArea(thList);
	}

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
