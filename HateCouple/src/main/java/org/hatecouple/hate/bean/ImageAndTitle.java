package org.hatecouple.hate.bean;

public class ImageAndTitle {
	private String c_movieName;
	private String c_posterName;

	public ImageAndTitle() {
		// TODO Auto-generated constructor stub
	}

	public ImageAndTitle(String c_movieName, String c_posterName) {
		super();
		this.c_movieName = c_movieName;
		this.c_posterName = c_posterName;
	}

	public String getC_movieName() {
		return c_movieName;
	}

	public void setC_movieName(String c_movieName) {
		this.c_movieName = c_movieName;
	}

	public String getC_posterName() {
		return c_posterName;
	}

	public void setC_posterName(String c_posterName) {
		this.c_posterName = c_posterName;
	}
	
	

}
