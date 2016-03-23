class ProductsController < ApplicationController
  def index
    @products= Product.all
  end

  def new
    @product= Product.new
  end

  def create
    @product= Product.new(params_product)
    puts params_product
    @product.save
    redirect_to products_path
  end

  def show
    @product= Product.find(params[:id])
  end

  def edit
    @product= Product.find(params[:id])
  end

  def update
    @product= Product.find(params[:id])
    @product.update_attributes(params_product)
    @product.save
    redirect_to products_path
  end



  def destroy
    @product= Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def params_product
    params.require(:product).permit(:name, :price, { category_ids:[] })
  end
end
