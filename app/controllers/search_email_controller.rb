class SearchEmailController < ApplicationController
  skip_before_action :authenticate_user!, only: [:validate_email, :welcome_email]
  def validate_email
    if params[:email]
      @search = true
      begin
        is_real = EmailVerifier.check(email_params)
        if is_real
          @email_live = 1
        else
          @email_live = 0
        end
      rescue Exception
        @email_live = 0
      end
    else
      @search = false
    end
    respond_to do |format|
      format.html { render 'validate_email' }
      format.json do
        return render json: {email_is_exist: @email_live },head: 200 if @search
        render json:{email_is_exist: 0},head: 200 if !@search
      end
    end
  end

  def welcome_email
    UserMailer.send_email_welcome("kyo.shenshie@gmail.com")
    redirect_to :root
  end
  private

  def email_params
    params.require(:email)
  end
end
