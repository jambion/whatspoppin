class PagesController < ApplicationController
  def show
    @reviews = Review.all
    render template: "pages/#{params[:page]}"
  end
  
  def browse
    # @reviews = Review.all
    @reviews = Review.order("created_at DESC") 
  end
  
  def about
    
  end
end
