class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'include both letters and numbers' }

  with_options presence: true do
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid.Input full-width characters.' }
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid.Input full-width characters.' }
    validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
    validates :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' }
  end
end
