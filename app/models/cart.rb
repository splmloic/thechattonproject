class Cart < ApplicationRecord
  extend FriendlyId
  friendly_id :user_id, use: :slugged

  belongs_to :user
  
  has_many :cart_items 
  has_many :items, through: :cart_items
  has_one :order
end
