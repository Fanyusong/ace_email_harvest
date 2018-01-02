class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :check_user

  private

  def check_user
    if current_user && current_user.class.to_s == "User"
      sign_out current_user
      render 'layouts/lock'
    end
  end
end
