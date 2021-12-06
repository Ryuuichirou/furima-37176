class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase_history
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :prefectures_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 
  validates :price, presence: true, numericality: {greater_than_or_equal_to:300, less_than_or_equal_to:9999999}
end
