package org.hatecouple.hate.db;

import java.util.ArrayList;

import org.hatecouple.hate.bean.ImageAndTitle;
import org.hatecouple.hate.bean.MovieAreaList;

public interface CineMapper {
	
//	public abstract List<Movie> getMovie();
	
	public abstract ArrayList<MovieAreaList> getMovieInArea(MovieAreaList MAL);
	
	public abstract ArrayList<ImageAndTitle> selectAreaMovieImg(MovieAreaList MAL);;
	
}
