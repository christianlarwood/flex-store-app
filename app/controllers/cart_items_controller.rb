class CartItemsController < ApplicationController
  def create
    @cart_item = @cart.cart_items.new(cart_item_params)

    @cart_item.quantity = params[:quantity].to_i
    @cart_item.price_cents = @cart_item.item.price_cents * @cart_item.quantity

    if @cart_item.save
      redirect_to root_path
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])

    if @cart_item.update(cart_item_params)
      @cart_item.update(price_cents: @cart_item.item.price_cents * @cart_item.quantity)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])

    @cart_item.destroy
    redirect_to root_path
  end

  private

  def cart_item_params
    params.permit(:item_id, :quantity, :weight)
  end
end
