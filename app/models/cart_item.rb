class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  belongs_to :promotion, optional: true

  before_save :set_weight_if_item_has_weight
  before_save :apply_best_promotion

  validates :price_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :weight, numericality: { greater_than: 0 }, allow_nil: true

  def apply_best_promotion
    self.promotion = best_promotion
    return unless promotion

    self.price_cents = item.price_cents * self.quantity - calculate_promotion_discount(promotion)
  end

  def best_promotion
    valid_promotions = Promotion.where("start_date <= ? AND ? <= end_date", DateTime.now, DateTime.now)

    item_promotions = valid_promotions.where(promotable_type: "Item", promotable_id: item_id)
    category_promotions = valid_promotions.where(promotable_type: "Category", promotable_id: item.category_id)

    (item_promotions + category_promotions).max_by { |promotion| calculate_promotion_discount(promotion) }
  end

  def calculate_promotion_discount(promotion)
    case promotion.promotion_type
    when "flat_fee"
      promotion.discount_cents
    when "percentage"
      (item.price_cents * (promotion.discount_percentage / 100.0)).round
    when "buy_x_get_y"
      buy_x_get_y_discount(promotion)
    when "weight_threshold"
      weight_discount(promotion)
    else
      0
    end
  end

  def buy_x_get_y_discount(promotion)
    return 0 unless quantity >= promotion.x_quantity

    if promotion.discount_percentage.to_i > 0
      ((quantity / (promotion.x_quantity + promotion.y_quantity)).round) * (promotion.discount_percentage / 100.0 ) * item.price_cents
    else
      (quantity / (promotion.x_quantity + promotion.y_quantity)) * item.price_cents
    end
  end

  def weight_discount(promotion)
    return 0 unless weight && weight >= promotion.weight_threshold

    (weight - promotion.weight_threshold) * (item.price_cents * (promotion.discount_percentage / 100.0)).round
  end

  private

  def set_weight_if_item_has_weight
    if item.unit_type == "weight"
      self.weight = item.unit_quantity * quantity
    end
  end
end
