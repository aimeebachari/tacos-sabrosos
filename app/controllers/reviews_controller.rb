class ReviewsController < ApplicationController

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
