class User::HistorySearchEmailsController < User::BaseController
  def index
    @history_search_results = HistorySearchEmail.where(user_id: current_user.id)
  end
end
