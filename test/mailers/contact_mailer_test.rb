require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "user_email" do
    mail = ContactMailer.user_email
    assert_equal "User email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "admin_email" do
    mail = ContactMailer.admin_email
    assert_equal "Admin email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
