module ApplicationHelper
  def full_name_of_user user
    if user.first_name && user.last_name
      full_name = user.first_name + " " + user.last_name
    else
      full_name = "Anonymous"
    end
    full_name
  end
end
