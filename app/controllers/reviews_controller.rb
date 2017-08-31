class ReviewsController < ApplicationController
  def index 
    @reviews = Review.all
  end
  
  def new 
    @review = Review.new
    if Movie.exists?(params[:movie_id])
      @movie = Movie.find(params[:movie_id])
    else  
      single = get_single_movie(params[:movie_id])
      @movie = Movie.create(id: params[:movie_id], title: single["title"])
    end
  end
  
  def create 
    @review = Review.new(review_params)
    @review.movie_id = params[:movie_id]
    if @review.save
      flash[:notice] = "Review was successfully created"
      redirect_to movie_path(@review.movie)
    else
      flash[:notice] = @review.errors.full_messages
      redirect_to new_movie_review_path(@review.movie)
    end
  end
  
  
private

  def review_params
    params.require(:review).permit(:comment, :rating, :user_email)
  end
  
  def get_single_movie(tmdb_id)
    genre_list = {
    28 => "Action", 12 => "Adventure", 16 => "Animation", 35 => "Comedy", 99 => "Documentary", 
    18 => "Drama", 10751 => "Family", 14 => "Fantasy", 36 => "History", 27 => "Horror", 
    10402 => "Music", 9648 => "Mystery", 10479 => "Romance", 878 => "Science Fiction", 10770 => "TV Movie", 
    53 => "Thriller", 10752 => "War", 37 => "Western"}
    
    result = Net::HTTP.get(URI.parse("https://api.themoviedb.org/3/movie/" + tmdb_id + "?api_key=4aa07b165bfe3ed8596da63f31c9a2bc"))    
    json = JSON.parse(result)
    movieHash = {
     	"title" => json["title"],
      "release_date" => json["release_date"],
      "genre" => genre_list[json["genres"].first["id"]],
      "poster_path" => json["poster_path"],
      "tmdb_id" => json["id"]
    }
    
    return movieHash
  end
end
