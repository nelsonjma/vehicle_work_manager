module ApplicationHelper

  def access_denied
    redirect_to login_path

  end

  # if session is alive less then 1 hours
  def session_in_time?
    return false unless session[:user_session_time]
    return false if (Time.now-Time.parse(session[:user_session_time].to_s)).to_i > 1800 # 30 minutos
    true
  end

  def refresh_session_time
    session[:user_session_time] = Time.now
  end

  def logged_in?
    current_user.is_a? User
  end

end
