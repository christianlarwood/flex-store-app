class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :promotion, null: false, foreign_key: true
      t.integer :price_cents
      t.integer :quantity
      t.integer :weight

      t.timestamps
    end
  end
end
