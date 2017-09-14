require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
    @review = Review.create(id: 57, user_email: "test@test.com", comment: "Nice movie!", rating: 10)
  end
  
  test "get index" do
    get :index, id: @review.id, user_email: @review.user_email, comment: @review.comment, rating: @review.rating
    assert_response :success
  end
  
end
