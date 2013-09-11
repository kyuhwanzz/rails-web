require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post's title must be over 5 characters" do
    post = Post.new(title: "titl", text: "text")
    assert !post.save
  end
end
