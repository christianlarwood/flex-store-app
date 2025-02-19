class PromotionsController < ApplicationController
  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)

    if @promotion.save
      render @promotion
    else
      render :new
    end
  end

  private

  def promotion_params
    params.require(:promotion).permit(:name, :promotable_type, :discount_percentage, :discount_cents, :x_quantity, :y_quantity, :promotable_type, :start_date, :end_date, :weight_threshold)
  end
end
