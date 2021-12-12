class PurchaseHistoryAddress
  include ActiveModel::Model
  attr_accessor :postal_cord, :prefectures_id, :municipalities, :house_number, :building_name, :telephone_number, :user_id, :item_id, :token
  with_options presence: true do
    validates :municipalities
    validates :house_number
    validates :user_id
    validates :item_id
    validates :token
    VALID_PASSWORD_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
    validates :postal_cord, format: { with: VALID_PASSWORD_REGEX, message: 'は半角文字で記述する必要があります' }
    validates :prefectures_id, numericality: { other_than: 1 }
    VALID_PASSWORD_REGEX = /\A[-]?[0-9]+(\.[0-9]+)?\z/
    validates :telephone_number, format: { with: VALID_PASSWORD_REGEX, message: 'は半角数値で記述する必要があります' }
  end
  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Address.create(postal_cord: postal_cord, prefectures_id: prefectures_id, municipalities: municipalities, house_number: house_number, building_name: building_name, telephone_number:telephone_number, purchase_history_id: purchase_history.id)
  end
end