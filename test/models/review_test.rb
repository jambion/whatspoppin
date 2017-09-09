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

  test "email addresses should be unique" do 
    duplicate_review = @review.dup
    duplicate_review.user_email = @review.user_email.upcase
    @review.save
    assert_not duplicate_review.valid?
  end
  
  test "email validation should accept valid addresses" do 
    valid_addresses = %w[user@example.om User@foo.COM A_US@foo.bar.org 
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @review.user_email = valid_address 
      assert @review.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @review.user_email = invalid_address
      assert_not @review.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @review.user_email = mixed_case_email
    @review.save
    assert_equal mixed_case_email.downcase, @review.reload.user_email
  end
  

  test "email should not be too long" do
    @review.user_email = "a" * 244 + "@example.com" 
    assert_not @review.valid?
  end
end
