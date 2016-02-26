package org.hatecouple.hate.bean;

public class imageNameAndTheaterName {
	private String c_posterName;
	private String c_theaterName;
	
	public imageNameAndTheaterName() {
		// TODO Auto-generated constructor stub
	}

	public imageNameAndTheaterName(String c_posterName, String c_theaterName) {
		super();
		this.c_posterName = c_posterName;
		this.c_theaterName = c_theaterName;
	}

	public String getC_posterName() {
		return c_posterName;
	}

	public void setC_posterName(String c_posterName) {
		this.c_posterName = c_posterName;
	}

	public String getC_theaterName() {
		return c_theaterName;
	}

	public void setC_theaterName(String c_theaterName) {
		this.c_theaterName = c_theaterName;
	}
	
	
}
