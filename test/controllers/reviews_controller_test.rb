require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  

  test "can get new review" do
    get "new"
    assert_response :success
  end  
  
end
