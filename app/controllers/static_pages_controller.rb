class StaticPagesController < ApplicationController
   
  def index
  end
  
  def landing_page
    @featured_product = Product.limit(3)
  end
  
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    @phone = params[:phone]
    UserMailer.contact_form(@email, @name, @message, @phone).deliver
  end
  
  def send_welcome_email
    @name = params[:name]
  end
  
end
