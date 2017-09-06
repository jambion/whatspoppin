class ReviewsController < ApplicationController
  require "net/http"
  require "uri"
  def index 
    @reviews = Review.order("created_at DESC") 
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
    result = Net::HTTP.get(URI.parse("https://api.themoviedb.org/3/movie/" + tmdb_id.to_s + "?api_key=4aa07b165bfe3ed8596da63f31c9a2bc"))    
    json = JSON.parse(result)
    movieHash = { "title" => json["title"] }
    return movieHash
  end
end
