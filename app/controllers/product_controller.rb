class ProductController < ApplicationController
  helper ApplicationHelper
  
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
end
