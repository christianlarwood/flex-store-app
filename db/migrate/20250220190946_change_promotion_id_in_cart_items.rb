class ChangePromotionIdInCartItems < ActiveRecord::Migration[7.1]
  def change
    change_column_null :cart_items, :promotion_id, true
  end
end
