class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|

      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.integer :order_id
      t.integer :cart_id
      
      t.timestamps
    end
  end
end
