module Buyers
  class OrderDetailsController < Buyers::BaseController
    attr_reader :order_detail, :order_details

    def create
      chosen_product = Product.find_by id: params[:product_id]
      current_order = current_cart.order_details
      if check_current_cart chosen_product, current_order
        flash[:success] = t "create_succ"
      else
        flash[:danger] = t "create_fail"
      end
      redirect_to buyers_products_path
    end

    def update
      order_detail = OrderDetail.find_by id: params[:id]
      add_button order_detail
      sub_button order_detail
      check_update order_detail
    end

    def destroy
      order_detail = OrderDetail.find_by id: params[:id]
      if order_detail.destroy
        flash[:success] = t "delete_succ"
        redirect_to carts_path
      else
        flash[:danger] = t "delete_fail"
        redirect_to root_path
      end
    end

    private

    def order_detail_params
      params.require(:order_detail).permit :quantity, :product_id, :cart_id
    end

    def check_current_cart chosen_product, current_order
      if current_cart.products.include?(chosen_product)
        order_detail = current_order.find_by product_id: chosen_product
        add_quantity_order_details order_detail
      else
        order_detail = current_order.build product_id: chosen_product
        add_order_detail current_cart, chosen_product, order_detail
      end
      order_detail.save
    end

    def add_button order_detail
      order_detail.add_quantity if params[:commit] == "+"
    end

    def sub_button order_detail
      order_detail.sub_quantity if params[:commit] == "-"
    end

    def check_update order_detail
      if order_detail.save
        redirect_to carts_path
      else
        flash[:danger] = t "update_fail"
        redirect_to root_path
      end
    end

    def add_quantity_order_details order_detail
      order_detail.add_quantity
    end

    def add_order_detail current_cart, chosen_product, order_detail
      order_detail.add_order_detail_exited current_cart, chosen_product
    end
  end
end
