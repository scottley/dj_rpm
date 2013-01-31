class SendTestEmail
  
  class << self
    
    def send_email!(reservation, queue = Delayed::Job)
      queue.enqueue TestJob.new(reservation)
      true
    end
    
  end
end