class User::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  layout 'application_user'

  private

  def check_user
    if !current_user.nil? && current_user.is_lock && current_user.class.to_s == "User"
      sign_out current_user
      render 'layouts/lock'
    end
  end
end