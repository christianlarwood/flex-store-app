class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  belongs_to :promotion, optional: true

  validates :price_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :weight, numericality: { greater_than: 0 }, allow_nil: true
end
