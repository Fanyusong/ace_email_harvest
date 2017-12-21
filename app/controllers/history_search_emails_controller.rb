class HistorySearchEmailsController < ApplicationController
  def index
    @history_search_results = HistorySearchEmail.where(user_id: current_user.id)
  end
end
