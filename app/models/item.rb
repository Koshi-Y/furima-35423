class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charges
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :prefecture
  has_one    :management

  has_one_attached :image
  belongs_to :user
  has_many   :comments

  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price,            inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :charges_id
      validates :prefecture_id
      validates :delivery_date_id
    end
  end
end
