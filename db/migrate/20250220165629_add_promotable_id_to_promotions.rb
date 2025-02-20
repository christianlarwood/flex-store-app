class AddPromotableIdToPromotions < ActiveRecord::Migration[7.1]
  def change
    add_column :promotions, :promotable_id, :integer, null: false
    add_index :promotions, :promotable_id
  end
end
