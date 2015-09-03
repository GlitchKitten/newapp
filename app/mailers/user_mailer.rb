class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def contact_form(email, name, message, phone)
    @message = message
    @email = email
    @phone = phone
    mail(:from => email,
      :to => 'ahaschenburger@gmail.com',
      :subject => "A new contact form message from #{name}")
  end
end
