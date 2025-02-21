class Promotion < ApplicationRecord
  belongs_to :promotable, polymorphic: true

  validates :name, presence: true, uniqueness: true
  validates :promotion_type, presence: true, inclusion: { in: %w(flat_fee percentage buy_x_get_y weight_threshold) }
  validates :discount_cents, numericality: { only_integer: true }, allow_nil: true
  validates :discount_percentage, numericality: { only_integer: true, in: 0..100 }, allow_nil: true
  validates :x_quantity, numericality: { only_integer: true }, allow_nil: true
  validates :y_quantity, numericality: { only_integer: true }, allow_nil: true
  validates :promotable_type, presence: true, inclusion: { in: %w(Item Category) }
  validates :promotable_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :check_promotion_overlap
  validate :check_start_date

  private

  def check_promotion_overlap
    existing_promotion = Promotion.where(
      promotable_type: promotable_type,
      promotable_id: promotable_id
    ).where(
      "? > end_date", start_date
    ).exists?

    if existing_promotion
      errors.add(:base, "A promotion already exists for this item or category during the selected timeframe")
    end
  end

  def check_start_date
    if start_date < DateTime.now
      errors.add(:start_date, "must be today or later")
    end
  end
end
