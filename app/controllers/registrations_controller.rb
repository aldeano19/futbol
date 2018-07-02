class RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.with(user: @user).welcome_email.deliver if @user.persisted?
  end


  private
  def sign_up_params
    params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation, :current_password)
  end
end
