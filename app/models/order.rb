class Order < ApplicationRecord
    after_create :send_order_confirmation

    def send_order_confirmation
        UserOrderMailer.order_confirmation(user, self).deliver_now
      end

belongs_to :user
has_many :order_items
has_many :items, through: :order_items

end
