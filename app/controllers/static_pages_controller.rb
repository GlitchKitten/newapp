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
    ActionMailer::Base.mail(:from => @email,
      :to => 'ahaschenburger@gmail.com',
      :subject => "A new contact message from #{@name}",
      :body => @message).deliver
  end
  
end
