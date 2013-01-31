namespace :dj_test do

  desc 'Exercises DJ to send a dummy email'
  task :send_email_test => [:environment] do
    reservation = Reservation.new(name: "Test Reservation")
    reservation.save
    SendTestEmail.send_email! reservation
  end

end