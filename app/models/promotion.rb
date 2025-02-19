class Promotion < ApplicationRecord
  belongs_to :promotable, polymorphic: true

  validates :name, presence: true, uniqueness: true
  validates :promotion_type, presence: true, inclusion: { in: %w(flat_fee, percentage, buy_x_get_y, weight_threshold) }
  validates :discount_cents, numericality: { only_integer: true }, allow_nil: true
  validates :discount_percentage, numericality: { only_integer: true, in: 0..100 }, allow_nil: true
  validates :x_quantity, numericality: { only_integer: true }, allow_nil: true
  validates :y_quantity, numericality: { only_integer: true }, allow_nil: true
  validates :promotable_type, presence: true, inclusion: { in: %w(Item, Category) }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
