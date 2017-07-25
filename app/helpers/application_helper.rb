module ApplicationHelper
  def current_profile
    current_user.profile if current_user && current_user.profile && current_user.profile.persisted?
  end
end
