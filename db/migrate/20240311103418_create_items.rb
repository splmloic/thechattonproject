class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.integer :item_id
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.integer :order_id
      t.string :cart_id
      t.string :integer

      t.timestamps
    end
  end
end
