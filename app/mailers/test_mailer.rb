class TestMailer < ActionMailer::Base

  def mail_for(reservation)

    @reservation = reservation
    to = "test@test.com"
    subject = "test email for reservation #{reservation.id}"
    from = "tester@tester.com"

    mail(to: to, subject: subject, from: from)

  end
end