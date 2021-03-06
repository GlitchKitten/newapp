class PaymentsController < ApplicationController
  load_and_authorize_resource
  
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price*100).to_i,
        :currency => "gbp",
        :source => token,
        :description => params[:stripeEmail]
      )
      flash[:success] = "Payment processed successfully"

      if (charge.paid == true)
      @order = Order.create(user_id: @user.id, product_id: @product.id, total: @product.price, )
      @order.save
      flash[:alert] = "Thank you for your order. You'll receive an email shortly"		       
    end
   
    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately there was an error processing your payment: #{error[:message]}"
      redirect_to products_path
    end

    redirect_to products_path
    UserMailer.confirmation_mail(@user, @product).deliver
  end

  def show
  end
  
end
