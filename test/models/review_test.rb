require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @review = Review.new(user_email: "Test@test.com", comment: "What a nice movie!", rating: 7, movie_id: 1)
  end

  test "review should be valid" do
    assert @review.valid?
  end
  
  test "email should be present" do
    @review.user_email = "       "
    assert_not @review.valid?
  end
  
  test "email should be valid" do
    @review.user_email = "testName"
    assert_not @review.valid?
  end
  
  test "rating should be present" do
    @review.rating = ""
    assert_not @review.valid?
  end
  
  test "comment can be empty" do 
    @review.comment = ""
    assert @review.valid?
  end
  
  test "only one email per review" do 
    @review.save
    @review2 = Review.new(user_email: "Test@test.com", comment: "Reviewing again", rating: 7, movie_id: 1)
    assert_not @review2.valid?
  end

end
