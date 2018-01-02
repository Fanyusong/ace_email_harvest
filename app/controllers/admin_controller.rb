class AdminController < ApplicationController
  before_action :admin_set_user, only: [:delete, :update]

  def index
    @users = User.all
  end
  def destroy
    @user.delete
    redirect_to admin_index_path
  end
  def update
    is_lock = @user.is_lock
    @user.update(is_lock: !is_lock)
    redirect_to admin_index_path
  end

  private

  def admin_set_user
    @user = User.find(params[:id])
  end
end
