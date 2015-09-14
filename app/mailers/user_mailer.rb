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
  
  def signup_mail(user)
    @user = user
    mail(:from => 'ahaschenburger@gmail.com', 
      :to => user.email,
      :subject => "Welcome to Litote Clothing")
  end
end
