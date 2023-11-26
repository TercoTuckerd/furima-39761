class BuyerOrder
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :area_id, :city, :address, :building, :phone, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :city, presence: true
    validates :address, presence: true
    validates :phone, presence: true, format: { with: /\A\d{10,11}\z/, length: {maximum: 11},message: "is invalid. Input only number"}
  end

  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Buyer.create(post_code: post_code, area_id: area_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end