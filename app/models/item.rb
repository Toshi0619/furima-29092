class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1, message: 'status Select' }
    validates :status_id, numericality: { other_than: 1, message: 'status Select' }
    validates :beard_id, numericality: { other_than: 1, message: 'status Select' }
    validates :area_id, numericality: { other_than: 0, message: 'status Select' }
    validates :day_id, numericality: { other_than: 1, message: 'status Select' }
    validates :price
  end

  validates :price, numericality: { with: /\A\d\z/, message: 'Half-width number.' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'Out of setting range' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :beard
  belongs_to_active_hash :day
  belongs_to_active_hash :status
  belongs_to_active_hash :category
end
