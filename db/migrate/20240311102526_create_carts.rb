class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.belongs_to :user, index: true
      t.belongs_to :items, index: true
      t.timestamps
    end
  end
end
