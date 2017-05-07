require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@post = Post.new(link: "www.youtube.com")
  end

  test "post should have a link" do
  	 @post.link = "     "
  	 assert_not @post.valid?
  end
  test "link should have maximum(2048 characters)" do
  	@post.link = "a"*2049
  	assert_not @post.valid?
  end
end
