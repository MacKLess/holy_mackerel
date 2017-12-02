class ReviewsController < ApplicationController
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
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review has been created!"
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params(:id))
    @product = @review.product
    if @review.update(review_params)
      flash[:notice] = "This review has been updated!"
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "No fishes, only wishes!"
    redirect_to products_path
  end

private
  def review_params
    params.require(:review).permit(:content, :product_id)
  end
end
