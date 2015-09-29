class PaymentsController < ApplicationController
  
  def create
    token = params[:stripeToken]
    
    begin
      charge = Stripe::Charge.create(
        :amount => 2000,
        :currency => "gbp",
        :source => token,
        :description => params[:stripeEmail]
      )
   
    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately there was an error processing your payment: #{error[:message]}"
      redirect_to product_path(product)
    end
  
    UserMailer.order_email(@first_name, @email).deliver
    
  end

  def payment_params
    params.require(:payment).permit(:price, :user_id)
  end
  
end
