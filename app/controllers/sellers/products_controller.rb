module Sellers
  class ProductsController < Sellers::BaseController
    def index
      @products = current_user.products.recent
    end

    def show
      @product = Product.find_by id: params[:id]
    end

    def new
      @product = current_user.products.new
      @categories = Category.pluck :name, :id
      @areas = Area.all
    end

    def create
      @product = Product.new product_params
      if product.save
        flash[:success] = t "products.messages.create_success"
        redirect_to sellers_product_path product
      else
        create_failed
      end
    end

    private

    attr_reader :product

    def product_params
      params.require(:product).permit Product::ATTRIBUTE_PARAMS
    end

    def create_failed
      @categories = Category.pluck :name, :id
      render :new
    end
  end
end
