require "test_helper"

class SupportMailboxTest < ActionMailbox::TestCase
  test "create support request when receiving a support email" do
    receive_inbound_email_from_mail(
      to: "support@example.org",
      from: "chris@somewhere.com",
      subject: "Hello world!",
      body: "Hello?"
    )
    support_request = SupportRequest.last
    assert_equal "chris@somewhere.com", support_request.email
    assert_equal "Hello world!", support_request.subject
    assert_equal "Hello?", support_request.body
    assert_nil support_request.order
  end

  test "create support request with most recent order" do
    recent_order = orders(:one)
    older_order  = orders(:another_one)
    non_customer = orders(:other_customer)

    receive_inbound_email_from_mail(
      to: "support@example.org",
      from: recent_order.email,
      subject: "Need help",
      body: "How do I check out?"
    )

    support_request = SupportRequest.last
    assert_equal recent_order.email, support_request.email
    assert_equal "Need help", support_request.subject
    assert_equal "How do I check out?", support_request.body
    assert_equal recent_order, support_request.order
  end
end
