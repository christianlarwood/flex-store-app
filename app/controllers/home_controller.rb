class HomeController < ApplicationController
  def index
    @items = Item.all
    @cart_items = @cart.cart_items.includes(item: :category).order("categories.name ASC, items.name ASC")
  end
end
