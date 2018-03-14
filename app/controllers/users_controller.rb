class UsersController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if user.save
      flash[:success] = t "devise.registrations.signed_up_but_unconfirmed"
      redirect_to new_user_session_path
    else
      create_failed
    end
  end

  private

  attr_reader :user

  def create_failed
    flash.now[:warning] = t "users.messages.create_fail"
    render :new
  end

  def user_params
    params.require(:user).permit User::ATTRIBUTE_PARAMS
  end
end
