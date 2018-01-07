class Admin::AdminController < Admin::BaseController

  def edit_profile
    @admin = current_admin
  end

  def update_info
    @admin = current_admin
    if @admin.valid_password? params[:admin][:current_password]
      if @admin.update(user_params)
        # Sign in the user by passing validation in case their password changed
        redirect_to '/admin'
      else
        render "edit_profile"
      end
    else
      @admin.errors.add(:current_password, "is wrong")
      render "edit_profile"
    end
  end

  private

  def user_params
    params.require(:admin).permit(:password, :password_confirmation, :first_name, :last_name, :phone, :birthday, :address)
  end

end
