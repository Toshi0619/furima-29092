class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'include both letters and numbers' }

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :firstname, format: { with: NAME_REGEX, message: 'is invalid.Input full-width characters.' }
    validates :lastname, format: { with: NAME_REGEX, message: 'is invalid.Input full-width characters.' }
    validates :firstname_kana, format: { with: KANA_REGEX, message: 'is invalid. Input full-width katakana characters.' }
    validates :lastname_kana, format: { with: KANA_REGEX, message: 'is invalid. Input full-width katakana characters.' }
    validates :nickname
    validates :birthday
  end
end
