class TestJob < Struct.new(:reservation)
  
  def perform
    Rails.logger.info "Performing job"
    mail = TestMailer.mail_for reservation
    mail.deliver
  end
  
  def success(job)
    Rails.logger.info "Job successful"
  end
  
  def error(job, exception)
    Rails.logger.info "Job error: #{exception}"
  end
  
end