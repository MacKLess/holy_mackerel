class ReviewsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    if params[:product_id]
      @product = Product.find(params[:product_id])
      @reviews = @product.reviews
    else
      @reviews = Review.all
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    if current_user
      @review = @product.reviews.new
    else
      flash[:alert] = "You must be logged in to leave a review."
      redirect_to product_path(@product)
    end
  end

  def create
    @product = Product.find(params[:product_id])
    if current_user
      @review = @product.reviews.new(review_params)
      if @review.save
        flash[:notice] = "Review has been created!"
        redirect_to review_path(@review)
      else
        render :new
      end
    else
      flash[:alert] = "You must be logged in to leave a review."
      redirect_to product_path(@product)
    end
  end

  def edit
    @review = Review.find(params[:id])
    if current_user != @review.user
      flash[:alert] = "This isn't your review! Find yourself another fish."
      redirect_to review_path(@review)
    end
  end

  def update
    @review = Review.find(params(:id))
    if current_user != @review.user
      flash[:alert] = "We're thrilled that you'd like to provide feedback on our fish, but you can only change your own review."
      redirect_to review_path(@review)
    else
      @product = @review.product
      if @review.update(review_params)
        flash[:notice] = "This review has been updated!"
        redirect_to review_path(@review)
      else
        render :edit
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user != @review.user
      flash[:alert] = "Sorry. You're not on the right boat to change this review."
      redirect_to review_path(@review)
    else
      @review.destroy
      flash[:notice] = "You threw this review back. Time to re-bait your hook!"
      redirect_to products_path
    end
  end

private
  def review_params
    params.require(:review).permit(:content, :product_id)
  end
end
