class Category < ApplicationRecord
  has_many :items
  has_many :promotions, as: :promotable

  validates :name, presence: true, uniqueness: true
end
