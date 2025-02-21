class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.all
  end

  def new
    @promotion = Promotion.new
  end

  def create
    promotable_id = promotion_params[:promotable_type] == "Item" ? params.dig(:promotion, :item_id) : params.dig(:promotion, :category_id)
    filtered_params = promotion_params.except(:item_id, :category_id)
    @promotion = Promotion.new(filtered_params.merge(promotable_id: promotable_id))

    if @promotion.save
      redirect_to promotions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :promotion_type, :discount_percentage, :discount_cents, :x_quantity, :y_quantity, :promotable_type, :promotable_id, :item_id, :category_id, :start_date, :end_date, :weight_threshold)
  end
end
