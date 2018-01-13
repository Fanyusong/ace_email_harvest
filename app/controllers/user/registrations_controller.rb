# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  layout 'application_user'

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :phone, :address, :birthday, :email, :password, :password_confirmation, :current_password)
  end
end
