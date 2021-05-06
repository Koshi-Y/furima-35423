class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  with_options presence: true,   format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/} do
    validates :last_name
    validates :first_name
  end

  with_options presence: true,   format: {with: /\A[ァ-ヶー－]+\z/} do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birthday,           presence: true
  validates :password,           format: {with: /\A[a-zA-Z0-9]+\z/}

end
