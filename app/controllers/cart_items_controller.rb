class CartItemsController < ApplicationController
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart = Cart.find(@cart_item.cart)

    if @cart_item.save
      redirect_to @cart
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart = Cart.find(@cart_item.cart)

    if @cart_item.update(cart_item_params)
      redirect_to @cart
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart = Cart.find(@cart_item.cart)

    @cart_item.destroy
    redirect_to @cart
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :weight)
  end
end
