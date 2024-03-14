class Item < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    has_many :order_items
    has_many :orders, through: :order_items
    
    has_many :cart_items 
    has_many :carts, through: :cart_items

    has_one_attached :image
end
