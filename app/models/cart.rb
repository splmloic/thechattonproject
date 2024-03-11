class Cart < ApplicationRecord
  has_one :user
  belongs_to :item
  
end
