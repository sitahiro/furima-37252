class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :card, :user, :item
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :building_name
    validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :item
    validates :user
  end
  
  def save
    Shipping.create(post_code: post_code, prefecture_id: prefecture.id, city: city, address: address, building_name: building_name, phone_number: phone_number, card: card)
    Card.create(user: user, item: item)
  end
end
