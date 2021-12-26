class Item < ApplicationRecord
  belongs_to :user
  #has_one :card
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :days

  with_options presence: true do
    validates :image
    validates :items_name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
    validates :price, numericality: { only_integer: true, message: "Half-width number" }
    validates :category_id, numericality: { other_than: 1 }
    validates :situation_id, numericality: { other_than: 1 }
    validates :cost_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :days_id, numericality: { other_than: 1 }
    validates :user
  end
end
