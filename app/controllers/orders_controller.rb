class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @orders = Order.all
  end
  
  def show
    @orders = Order.all.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @order = Order.new
  end
  
  def create
  end
  
  def destroy
    @order.destroy 
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.  
  def set_order
    @order= Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:id, :product_id, :user_id, :total)
  end
end