package org.hatecouple.hate.bean;

public class MovieAreaList {
	private String c_theaterName;
	private String c_movieName;
	private String c_movieTime;
	private String c_clearChair;

	public MovieAreaList() {
		// TODO Auto-generated constructor stub
	}

	public MovieAreaList(String c_theaterName, String c_movieName, String c_movieTime, String c_clearChair) {
		super();
		this.c_theaterName = c_theaterName;
		this.c_movieName = c_movieName;
		this.c_movieTime = c_movieTime;
		this.c_clearChair = c_clearChair;
	}

	public String getC_theaterName() {
		return c_theaterName;
	}

	public void setC_theaterName(String c_theaterName) {
		this.c_theaterName = c_theaterName;
	}

	public String getC_movieName() {
		return c_movieName;
	}

	public void setC_movieName(String c_movieName) {
		this.c_movieName = c_movieName;
	}

	public String getC_movieTime() {
		return c_movieTime;
	}

	public void setC_movieTime(String c_movieTime) {
		this.c_movieTime = c_movieTime;
	}

	public String getC_clearChair() {
		return c_clearChair;
	}

	public void setC_clearChair(String c_clearChair) {
		this.c_clearChair = c_clearChair;
	}

}
