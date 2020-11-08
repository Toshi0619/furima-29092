class Shopaddress < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # with_options presence: true do
  #   validates :postcode
  #   validates :prefectures_id
  #   validates :municipality
  #   validates :address
  #   validates :phone_number
  # end
end
