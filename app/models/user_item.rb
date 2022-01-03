class UserItem
  include ActiveModel::Model
  attr_accessor :nickname, :email, :encrypted_password, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_day, :image, :items_name, :explanation, :price, :category_id, :situation_id, :cost_id, :prefecture_id, :days_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  validates :nickname, presence: true
  validates :birth_day, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end

  with_options presence: true do
    validates :image
    validates :items_name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates :category_id, numericality: { other_than: 1 }
    validates :situation_id, numericality: { other_than: 1 }
    validates :cost_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :days_id, numericality: { other_than: 1 }
    validates :user
  end

  def save
    user =  User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, first_name: first_name, family_name: family_name, first_name_kana: first_name_kana, family_name_kana: family_name_kana, birth_day: birth_day)
    Item.create(image: image, name: name, introduction: introduction, category_id: category.id, item_condition_id: item_condition.id, postage_id: postage.id, prefecture_id: prefecture.id, prepare_id: prepare.id, price: price, user_id: user.id)
  end
end
