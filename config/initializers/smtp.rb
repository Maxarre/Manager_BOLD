ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: 'manager.bold.poncelet@gmail.com',
  password: 'TestBOLD5665',
  authentication: :login,
  enable_starttls_auto: true
}
