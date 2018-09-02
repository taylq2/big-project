module Buyers
  class ProductsController < Buyers::BaseController
    def index
      @categories = Category.all
      @products = Product.product_by_category(@categories)
        .product_by_area(current_user.area_id).product_by_time.recent
    end

    def show
      @product = Product.find_by id: params[:id]
    end
  end
end
