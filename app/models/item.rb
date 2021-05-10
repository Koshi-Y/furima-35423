class Item < ApplicationRecord

  validates :image,            presence: true
  validates :item_name,        presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :price,            presence: true, numericality: {in: 300..9999999}, format: { with: /\A[0-9]+\z/ }
  validates :charges_id,       presence: true
  validates :prefecture_id,    presence: true
  validates :delivery_date_id, presence: true

  has_one_attached :image
  belongs_to :user
end