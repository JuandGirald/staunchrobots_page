ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "staunchrobots.com",
  :user_name            => "todd.morrill@staunchrobots.com",
  :password             => ENV["GMAIL_PASSWORD"],
  :authentication       => :plain,
  :enable_starttls_auto => true
}
