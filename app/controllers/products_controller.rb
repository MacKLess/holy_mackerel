class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @products = Product.alphabetical
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
      @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "A new fish is on the list!"
      redirect_to products_path
    else
      flash[:alert] = @product.errors.full_messages
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Fish updated!"
      redirect_to products_path(@product)
    else
      flash[:alert] = @products.errors.full_messages
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.reviews.each do |review|
      review.destroy
    end
    @product.destroy
    flash[:notice] = "Fish '#{@product.name}' is no longer available. Better bait a new hook."
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :cost, :guide, :notes)
  end
end
