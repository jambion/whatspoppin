require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "get show" do
    get movie_path(movies(:minions))
    assert_response :success
  end
end
