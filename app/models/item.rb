class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :cart_items

  validates :name, presence: true, uniqueness: true
  validates :price_cents, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :unit_type, presence: true, inclusion: { in: %w(weight, quantity) }
  validates :unit_quantity, presence: true
  validates :unit_of_measurement, presence: true, inclusion: { in: %w(g, kg, oz, lb, each, pack) }
end
