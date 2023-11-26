class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyerorder = BuyerOrder.new
  end
  
  def create
    @buyerorder = BuyerOrder.new(order_params)
    if @buyerorder.valid?
      @buyerorder.save(params,current_user.id)
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

private
  def order_params
    params.require(:buyer_order).permit(:post_code, :area_id, :city, :address, :building, :phone).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
