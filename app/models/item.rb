class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :catagory_id
    validates :status_id
    validates :beard_id
    validates :area_id
    validates :days_id
    validates :price
    validates :user
  end


end
