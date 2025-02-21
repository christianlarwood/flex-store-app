class HomeController < ApplicationController
  def index
    @items = Item.all
    @cart_items = @cart.cart_items
  end
end
