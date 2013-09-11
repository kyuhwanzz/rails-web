require 'test_helper'

class PostMailerTest < ActionMailer::TestCase
  tests PostMailer

  test "send an e-mail" do
    post = Post.new(title: "test post", text: "test post text")
    email = PostMailer.send_email_notification(post).deliver

    assert !ActionMailer::Base.deliveries.empty?

    assert_equal ['msdn.isdg@gmail.com'], email.from
  end
end
