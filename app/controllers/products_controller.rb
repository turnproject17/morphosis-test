class ProductsController < ApplicationController
  def index
    @products = Product.available    
  end

  def show
    @product = Product.find_by(params[:id])
  end
end
