class ReviewsController < ApplicationController

  def edit
    @review = Review.find(params[:id])
    @taco_shop = @review.taco_shop
    @user = current_user
  end

  def update
    @review = Review.find(params[:id])
    @taco_shop = @review.taco_shop

    if @review.update(review_params)
      flash[:alert] = "Review updated successfully!"
      redirect_to @taco_shop
    else
      flash.now[:notice] = @review.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:event_id])
    @taco_shop = @review.taco_shop
    @user = current_user

    if @user.id == @review.user_id || @user.admin?
      @review.destroy
      flash[:notice] = "Review successfully deleted."
      redirect_to @taco_shop
    else
      flash[:notice] = "You don't have permission to delete this review!"
      redirect_to @taco_shop
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
