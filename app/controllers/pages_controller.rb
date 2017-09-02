class PagesController < ApplicationController
  def show
    @reviews = Review.all
    render template: "pages/#{params[:page]}"
    
  end
  
  def browse
    @reviews = Review.all
  end
end
