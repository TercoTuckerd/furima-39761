class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create, :correct_order]
  before_action :authenticate_user!, only: [:index]
  before_action :correct_order, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buyerorder = BuyerOrder.new
  end
  
  def create
    @buyerorder = BuyerOrder.new(order_params)
    if @buyerorder.valid?
      pay_item
      @buyerorder.save(params,current_user.id)
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

private
  def order_params
    params.require(:buyer_order).permit(:post_code, :area_id, :city, :address, :building, :phone).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def correct_order
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
