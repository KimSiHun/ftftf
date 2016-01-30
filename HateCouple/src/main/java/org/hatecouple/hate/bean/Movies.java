package org.hatecouple.hate.bean;

import java.util.List;

public class Movies {
	private List<Movie> movies;

	public Movies() {
		// TODO Auto-generated constructor stub
	}

	public Movies(List<Movie> movies) {
		super();
		this.movies = movies;
	}

	public List<Movie> getMovies() {
		return movies;
	}

	public void setMovies(List<Movie> movies) {
		this.movies = movies;
	}

}
