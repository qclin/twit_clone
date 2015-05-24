require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Sample", email: "pretty@sweet.co", password: "fireIsland", password_confimation: "fireIsland")
  end 

  test "associated tweets should be destroyed" do 
    @user.save 
    @user.tweets.create!(content:"great weekend comes with greater responsibilities")
    assert_difference 'Tweet.count', -1 do 
      @user.destroy 
    end 
  end 
end
