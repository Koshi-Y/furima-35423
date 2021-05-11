class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charges
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :prefecture

  has_one_attached :image
  belongs_to :user


  validates :image,            presence: true
  validates :item_name,        presence: true
  validates :description,      presence: true
  validates :category_id,      presence: true, numericality: { other_than: 1 }
  validates :condition_id,     presence: true, numericality: { other_than: 1 }
  validates :price,            presence: true, inclusion: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :charges_id,       presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,    presence: true, numericality: { other_than: 1 }
  validates :delivery_date_id, presence: true, numericality: { other_than: 1 }

  

  
 
end