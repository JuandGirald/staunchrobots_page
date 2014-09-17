ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "staunchrobots.com",
  :user_name            => "juan.giraldo@staunchrobots.com",
  :password             => ENV["GMAIL_PASSWORD"],
  :authentication       => :plain,
  :enable_starttls_auto => true
}
