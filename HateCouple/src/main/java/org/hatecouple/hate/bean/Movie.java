package org.hatecouple.hate.bean;

import java.math.BigDecimal;
import java.util.Date;

public class Movie {
	private String c_movie_title;
	private String c_name;
	private String c_cine_location;
	private String c_date;
	private String c_room_no;
	private Date c_current_time;
	private String c_begin_time;
	private BigDecimal c_runtime;
	private BigDecimal c_clearSeat;
	private String c_poster_img;
	
	public Movie() {
		// TODO Auto-generated constructor stub
	}

	public Movie(String c_movie_title, String c_name, String c_cine_location, String c_date, String c_room_no,
			Date c_current_time, String c_begin_time, BigDecimal c_runtime, BigDecimal c_clearSeat,
			String c_poster_img) {
		super();
		this.c_movie_title = c_movie_title;
		this.c_name = c_name;
		this.c_cine_location = c_cine_location;
		this.c_date = c_date;
		this.c_room_no = c_room_no;
		this.c_current_time = c_current_time;
		this.c_begin_time = c_begin_time;
		this.c_runtime = c_runtime;
		this.c_clearSeat = c_clearSeat;
		this.c_poster_img = c_poster_img;
	}

	public String getC_movie_title() {
		return c_movie_title;
	}

	public void setC_movie_title(String c_movie_title) {
		this.c_movie_title = c_movie_title;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_cine_location() {
		return c_cine_location;
	}

	public void setC_cine_location(String c_cine_location) {
		this.c_cine_location = c_cine_location;
	}

	public String getC_date() {
		return c_date;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public String getC_room_no() {
		return c_room_no;
	}

	public void setC_room_no(String c_room_no) {
		this.c_room_no = c_room_no;
	}

	public Date getC_current_time() {
		return c_current_time;
	}

	public void setC_current_time(Date c_current_time) {
		this.c_current_time = c_current_time;
	}

	public String getC_begin_time() {
		return c_begin_time;
	}

	public void setC_begin_time(String c_begin_time) {
		this.c_begin_time = c_begin_time;
	}

	public BigDecimal getC_runtime() {
		return c_runtime;
	}

	public void setC_runtime(BigDecimal c_runtime) {
		this.c_runtime = c_runtime;
	}

	public BigDecimal getC_clearSeat() {
		return c_clearSeat;
	}

	public void setC_clearSeat(BigDecimal c_clearSeat) {
		this.c_clearSeat = c_clearSeat;
	}

	public String getC_poster_img() {
		return c_poster_img;
	}

	public void setC_poster_img(String c_poster_img) {
		this.c_poster_img = c_poster_img;
	}
	
	

}
