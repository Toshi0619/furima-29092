class AddressOrder
  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :user_id, :item_id, :token, :postcode,  :prefecture_id, :municipality, :address, :building_name, :phone_number

  validates :token, presence: true

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :municipality
    validates :address
    validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: 'Input only half number' }
  end
  
  

  def save
    order = Order.create!(user_id: user_id, item_id: item_id, token: token)
    Shopaddress.create!(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end