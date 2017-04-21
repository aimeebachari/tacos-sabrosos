class TacoShopsController < ApplicationController
  def index
    @taco_shops = TacoShop.all
  end

  def new
    @taco_shop = TacoShop.new
  end

  def create
    @taco_shop = TacoShop.create(taco_shop_params)

    if @taco_shop.save
      flash[:notice] = "Taco Shop created successfully!"
      redirect_to @taco_shop
    else
      flash[:alert] = @taco_shop.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @taco_shop = TacoShop.find(params[:id])
    @review = Review.new
    @user = current_user
    @reviews = @taco_shop.reviews
  end

  private

  def taco_shop_params
    params.require(:taco_shop).permit(:name, :address, :description)
  end
end
