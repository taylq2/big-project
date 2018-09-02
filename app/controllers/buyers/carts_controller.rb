module Buyers
  class CartsController < Buyers::BaseController
    def index
      @carts = current_cart
    end

    def destroy
      if current_cart.destroy
        flash[:success] = t "destroy_succ"
        session[:cart_id] = nil
      else
        flash[:danger] = t "destroy_fail"
      end
      redirect_to root_path
    end
  end
end
