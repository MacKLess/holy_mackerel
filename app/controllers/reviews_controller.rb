class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    @product = Product.find(params[:product_id])
  end

  def new
    @product = Product.find(params[:product_id])
    if current_user
      @review = @product.reviews.new
    else
      flash[:alert] = "You have to be logged in to leave a review."
      redirect_to product_path(@product)
    end
  end

  def create
    @product = Product.find(params[:product_id])
    if current_user
      @review = @product.reviews.new(review_params)
      @review.user_id = current_user.id
      if @review.save
        flash[:notice] = "Review has been created!"
        redirect_to product_path(@product)
      else
      flash[:alert] = @review.errors.full_messages
      render :new
      end
    else
      flash[:alert] = "You must be logged in to leave a review."
      redirect_to product_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if current_user != current_user.admin?
      flash[:alert] = "Sorry. You're not on the right boat to change this review."
    else
      @review.destroy
      flash[:notice] = "You threw this review back. Time to re-bait your hook!"
    end
    redirect_to review_path(@review)
  end

private
  def review_params
    params.require(:review).permit(:content)
  end
end
