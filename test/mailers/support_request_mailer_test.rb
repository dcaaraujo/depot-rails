require "test_helper"

class SupportRequestMailerTest < ActionMailer::TestCase
  test "respond" do
    request = support_requests(:one)
    mail = SupportRequestMailer.respond(request)
    assert_equal "Re: Hello World", mail.subject
    assert_equal [ request.email ], mail.to
    assert_equal [ "support@example.com" ], mail.from
    assert_match request.body, mail.body.encoded
  end
end
