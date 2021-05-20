class Management < ApplicationRecord
  belongs_to :buyer
  belongs_to :item
  belongs_to :user
end
