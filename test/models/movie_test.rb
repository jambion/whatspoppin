require 'test_helper'

class MovieTest < ActiveSupport::TestCase

  def setup
    @movie = Movie.new(title: "Minions", id: 211672)
  end
  
  test "movie should be valid" do 
    assert @movie.valid?
  end
  
  test "movie should be present" do 
    @movie.title = " "
    assert_not @movie.valid?
  end
  
  test "id should be present" do 
    @movie.id = " "
    assert_not @movie.valid?
  end
  
  test "id should only be an integer" do 
    @movie.id = "string"
    assert_not @movie.valid?
  end
end
