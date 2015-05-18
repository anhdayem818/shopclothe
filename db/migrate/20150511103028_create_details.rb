class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :bill_id
      t.integer :product_id
      t.integer :price
      t.integer :quantity
      t.integer :total

      t.timestamps null: false
    end
  end
end
