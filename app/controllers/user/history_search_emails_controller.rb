class User::HistorySearchEmailsController < User::BaseController
  def index
    @history_search_results = HistorySearchEmail.where(user_id: current_user.id).paginate(:page => params[:page] || 1, :per_page => 10)
  end
end
