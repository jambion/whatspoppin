class MoviesController < ApplicationController
  require "net/http"
  require "uri"
  
  def index
    @movies = Movie.order("created_at DESC")
  end
  
  def show 
    @movie = get_single_movie(params[:id])
    @reviews = Review.where(movie_id: params[:id])
  end
  
private 
  
  def get_single_movie(tmdb_id)
    genre_list = {
    28 => "Action", 12 => "Adventure", 16 => "Animation", 35 => "Comedy", 99 => "Documentary", 
    18 => "Drama", 10751 => "Family", 14 => "Fantasy", 36 => "History", 27 => "Horror", 
    10402 => "Music", 9648 => "Mystery", 10479 => "Romance", 878 => "Science Fiction", 10770 => "TV Movie", 
    53 => "Thriller", 10752 => "War", 37 => "Western"}
    
    result = Net::HTTP.get(URI.parse("https://api.themoviedb.org/3/movie/" + tmdb_id + "?api_key=4aa07b165bfe3ed8596da63f31c9a2bc"))    
    json = JSON.parse(result)
    movie_info = {
     	"title" => json["title"],
      "release_date" => json["release_date"],
      "genre" => genre_list[json["genres"].first["id"]],
      "poster_path" => json["poster_path"],
      "tmdb_id" => json["id"],
      "overview" => json["overview"]
    }
    
    return movie_info
  end
end
