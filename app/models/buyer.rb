class Buyer < ApplicationRecord
  belongs_to :order

  #validates :post_code, presence: true
  #validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  #validates :city, presence: true
  #validates :address, presence: true
  #validates :building
  #validates :phone, presence: true

end
