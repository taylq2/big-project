module SessionsHelper
  def current_cart
    if current_user.present?
      current_user.cart || current_user.create_cart
    else
      flash[:danger] = t "must_be_login"
      redirect_to root_path
    end
  end
end
