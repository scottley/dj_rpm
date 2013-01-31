class SendTestEmail
  
  class << self
    
    def send_email!(reservation, queue = Delayed::Job)
      return false unless reservation.may_email?
      queue.enqueue TestJob.new(reservation)
      true
    end
        
    # Callback from TestJob so that we update the reservation with the result
    def job_result(result, reservation, message="", logger = Rails.logger)
      reservation.mark_email_sent
    end
    
  end
end