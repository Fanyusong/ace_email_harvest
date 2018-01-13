class User::EmailCampaignsController < User::BaseController

  def index
    @email_campaigns = EmailCampaign.where(user_id: current_user.id)
  end

  def show
    @email_campaign = EmailCampaign.find(params[:id])
    @max_number = JSON.parse(@email_campaign.list_email).length || 100
    @open_count = @email_campaign.messages.where("ahoy_messages.opened_at IS NOT NULL").group_by_day(:opened_at, range: @email_campaign.start_time.at_beginning_of_day..@email_campaign.end_time)
    @percent_complete = @email_campaign.messages.where("ahoy_messages.opened_at IS NOT NULL").count * 100/@max_number
  end

  def new
    @email_campaign = EmailCampaign.new
  end

  def create
    start_time = params[:start_time]
    end_time = params[:end_time]
    @start_time = Time.new start_time["date(1i)"].to_i, start_time["date(2i)"].to_i, start_time["date(3i)"].to_i, start_time["date(4i)"].to_i, start_time["date(5i)"].to_i
    @end_time = Time.new end_time["date(1i)"].to_i, end_time["date(2i)"].to_i, end_time["date(3i)"].to_i, end_time["date(4i)"].to_i, end_time["date(5i)"].to_i
    @email_campaign = EmailCampaign.new(start_time: @start_time, end_time: @end_time, user_id: current_user.id, file: params[:file_data])
    if @email_campaign.save!
      array = @email_campaign.read_csv
      if Rails.env == "production"
        EmailCampaignJob.perform_async(array, params[:from], params[:subject], params[:content], @email_campaign.id)
      end
      if Rails.env == "development"
        EmailCampaignWorker.perform_in(@start_time,array, params[:from], params[:subject], params[:content], @email_campaign.id)
      end
      redirect_to user_email_campaigns_path
    else
      render 'new'
    end
  end

  private

  def send_email_params
    params.permit(:from, :content, :subject, start_time: [], end_time: [], file_data: [])
  end

end
