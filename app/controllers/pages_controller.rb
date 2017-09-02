class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
  end
  
  def browse
    @reviews = Review.all
  end
end
