class SessionsController < Devise::SessionsController
  layout "login"

  def create
    @result =
      if user_signed_in?
        {success: true, message: t("session.sign_in_success")}
      else
        {success: false, message: t("session.sign_in_fail")}
      end
  end
end
