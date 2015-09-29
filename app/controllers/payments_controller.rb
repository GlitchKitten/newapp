class PaymentsController < ApplicationController
  
  def create
    @product = Product.find(params[:product_id])
    token = params[:stripeToken]
    
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price*100).to_i,
        :currency => "gbp",
        :source => token,
        :description => params[:stripeEmail]
      )
   
    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately there was an error processing your payment: #{error[:message]}"
      redirect_to products_path
    end
  
    UserMailer.order_email(@first_name, @email).deliver
    redirect_to products_path
  end
  
end
