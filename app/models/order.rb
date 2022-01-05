class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :card, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :building_name
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :item_id
    validates :user_id
  end
  
  def save
    card = Card.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture.id, city: city, address: address, building_name: building_name, phone_number: phone_number, card_id: card.id)
  end
end
