class UserMailer < ActionMailer::Base
  default from: "ahaschenburger@gmail.com"
  
  def contact_form(email, name, message, phone)
    @name = name
    @message = message
    @email = email
    @phone = phone
    mail(:from => email,
      :to => 'ahaschenburger@gmail.com',
      :subject => "A new contact form message from #{name}")
  end
  
  def welcome_email(user)
    @user = user
    @name = name
    mail(:to => "#{user.email}", :subject => "Welcome to Litote Clothing")
  end
  
end
