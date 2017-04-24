class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    data = request.body.read
    info_hash = JSON.parse(data)
    @body = info_hash["body"]
    @taco_shop_id = info_hash["taco_shop_id"]

    review = Review.new(body: @body, taco_shop_id: @taco_shop_id, user: current_user)

    if review.save
      render json: Review.where(taco_shop_id: @taco_shop_id)
    end
  end

end
