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
    mail(:to => "#{user.email}", :subject => "Welcome to Litote Clothing")
  end
  
  def confirmation_mail(user, product)
    @user = user
    @product = product
    mail(:from => 'ahaschenburger@gmail.com',
      :to => user.email,
      :subject => "Order Confirmation")
  end
  
end
