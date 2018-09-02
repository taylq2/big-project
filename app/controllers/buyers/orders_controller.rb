module Buyers
  class OrdersController < Buyers::BaseController
    attr_reader :order, :orders

    before_action :authenticate_user!
    load_and_authorize_resource

    def index
      page_params = params[:page]
      per_page = Settings.page.per_page
      @orders =
        if current_user.seller?
          Order.paginate page: page_params, per_page: per_page
        else
          Order.shopping_cart(current_user).paginate page: page_params,
            per_page: per_page
        end
    end

    def new; end

    def create
      order = Order.new order_params
      current_cart.order_details.each do |item|
        order.order_details << item
      end
      order_save order
    end

    def update
      if order.update_attributes order_params
        respond_to do |format|
          format.js
          format.html
        end
      else
        flash.now[:warning] = t "update_fail"
        render :index
      end
    end

    def destroy
      if order.destroy
        flash[:success] = t "destroy_succ"
        redirect_to user_orders_path
      else
        flash[:danger] = t "delete_fail"
        redirect_to root_path
      end
    end

    private

    def order_params
      params.require(:order).permit Order::ATTRIBUTE_PARAMS
    end

    def order_save order
      if order.save
        flash[:success] = t "order_success"
        redirect_to root_path
      else
        render :new
        flash[:danger] = t "create_fail"
      end
    end
  end
end
