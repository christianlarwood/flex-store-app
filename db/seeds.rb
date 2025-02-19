# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

brands_file_path = "./db/brands.csv"
categories_file_path = "./db/categories.csv"

CSV.foreach(brands_file_path, headers: true) { |row|
  Brand.find_or_create_by(name: row["name"])
}

CSV.foreach(categories_file_path, headers: true) { |row|
  Category.find_or_create_by(name: row["name"])
}