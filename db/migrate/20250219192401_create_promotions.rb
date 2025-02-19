class CreatePromotions < ActiveRecord::Migration[7.1]
  def change
    create_table :promotions do |t|
      t.string :name
      t.string :promotion_type
      t.integer :discount_percentage
      t.integer :discount_cents
      t.integer :x_quantity
      t.integer :y_quantity
      t.string :promotable_type
      t.datetime :start_date
      t.datetime :end_date
      t.integer :weight_threshold

      t.timestamps
    end
  end
end
