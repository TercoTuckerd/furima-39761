class Item < ApplicationRecord
  belongs_to :user
  #has_many :comments, dependent: :destroy
  #has_one  :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category
  belongs_to :Condition
  belongs_to :Charge
  belongs_to :Area
  belongs_to :Wait

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :wait_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end