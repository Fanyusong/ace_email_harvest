class User::SearchEmailController < User::BaseController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if params[:email]
      @search = true
      begin
        if EmailValidator.valid?(email_params)
          is_real = EmailVerifier.check(email_params)
          @email_live = is_real ? 1 : 0
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
      format.html
      format.json do
        return render json: {email_is_exist: @email_live },head: 200 if @search
        render json:{email_is_exist: 0},head: 200 if !@search
      end
    end
  end

  def download
    if current_user
      send_file "#{Rails.public_path}/ACE_EmailHarvest_Install.zip", type: 'application/zip', disposition: 'inline'
    end
  end
  private

  def email_params
    params.require(:email)
  end
end
