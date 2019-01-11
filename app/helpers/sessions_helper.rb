module SessionsHelper
  def log_in(user)
    # these cookies are encrypted
    # only for temp sessions though
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    Rails.logger.info "[jbootz] @current_user:#{current_user}"
    Rails.logger.info "[jbootz] !@current_user.nil? #{!@current_user.nil?}"
    !@current_user.nil?
  end
end
