class Api::V1::TacoShopsController  < ApplicationController

  def show
    @taco_shop = TacoShop.find(params[:id])
    @reviews = @taco_shop.reviews
    render json: { reviews: @reviews }
  end
end
