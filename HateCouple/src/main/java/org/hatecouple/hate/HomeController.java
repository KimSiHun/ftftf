package org.hatecouple.hate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ArrayList<ImageAndTitle> getClientList(@RequestBody List<Map<String, Object>> list,HttpServletRequest req) {
		ArrayList<TheaterList> thList = new ArrayList<TheaterList>();
		HttpSession session = req.getSession();
		for (Map<String, Object> t : list) {

			TheaterList th = new TheaterList();
			th.setC_theaterName(t.get("c_theaterName").toString());

			thList.add(th);
		}
		session.setAttribute("list", thList);
		return d.getMovieInArea(thList);
	}

	@RequestMapping(value = "/zxcv", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<MovieAreaList> getimgLink(HttpServletRequest req) {
		ArrayList<MovieAreaList> mal = new ArrayList<MovieAreaList>(); 
		mal = d.getMovieListAboutImglink(req);
		return mal;
	}

}
