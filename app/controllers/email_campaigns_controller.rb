class EmailCampaignsController < ApplicationController

  def index
    @email_campaigns = EmailCampaign.where(user_id: current_user.id)
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
      EmailCampaignWorker.perform_async(@email_campaign.id, params[:from], params[:subject], params[:content])
      redirect_to email_campaigns_path
    else
      render 'new'
    end
  end

  private

  def send_email_params
    params.permit(:from, :content, :subject, start_time: [], end_time: [], file_data: [])
  end

end
