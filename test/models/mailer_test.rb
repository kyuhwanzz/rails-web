require 'test_helper'

class MailerTest < ActiveSupport::TestCase
  test "getting mailers" do
    mailers = Mailer.where(activate: true)
    assert !mailers.nil?
    assert mailers.size > 0
  end
end
