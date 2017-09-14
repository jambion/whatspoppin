require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup 
    @movie = Movie.create(id: 7071738, title: "Test Movie")
  end
  
  test "get index" do
    get :index, id: @movie.id, title: @movie.title
    assert_response :success
  end

end
