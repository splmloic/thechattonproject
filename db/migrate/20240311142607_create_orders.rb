class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
