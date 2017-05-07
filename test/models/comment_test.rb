require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
  	@comment = Comment.new(body:"Jajajaja...ja XD")
  end

  test "comment should have a body" do
  	@comment.body = "        "
  	assert_not @comment.valid?
  end

  test "comment should have maximum(10000 characters)" do
  	@comment.body = "a"*10001
  	assert_not @comment.valid?
  end
end
