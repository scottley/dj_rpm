class TestJob < Struct.new(:reservation)
  
  def perform
    Rails.logger.info "Performing job"
    mail = TestMailer.mail_for reservation
    mail.deliver
  end
  
  def success(job)
    Rails.logger.info "Job successful"
    SendTestEmail.job_result(:ok, reservation, "Mail sent")
  end
  
  def error(job, exception)
    Rails.logger.info "Job error: #{exception}"
    SendTestEmail.job_result(:error, reservation, exception.backtrace)
  end
  
end