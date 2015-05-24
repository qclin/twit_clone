require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:chump)
    # @tweet = Tweet.new(content: "Lorem ipsum", user_id: @user.id)
    @tweet = @user.tweets.build(content: "Lorem ipsum")
  end 

  test "should be valid" do 
    assert @tweet.valid?
  end 

  test 'user id should be there' do 
    @tweet.user_id = nil
    assert_not @tweet.valid?
  end 

  test 'content should be there' do 
    @tweet.content = "    "
    assert_not @tweet.valid?
  end 

  test 'maximum content should not exceed 140 characters' do 
    @tweet.content = 'a' * 141
    assert_not @tweet.valid? 
  end 

  test 'display order from most recent' do 
    assert_equal Tweets(:most_recent), Tweet.first
  end
  
end
