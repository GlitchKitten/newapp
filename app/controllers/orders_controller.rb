class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @orders = Order.all
  end
  
  def show
  end
  
  def new
    @order = Order.new
  end
  
  def create
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.  
  def set_order
    @order= Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:product_id, :user_id)
  end
end