module SessionHelper

  def build_user_session(user_id)
    session[:user_id] = user_id
    session[:user_session_time] = Time.now
    session[:user_session_id] = (Time.now.nsec + Random.new(1000).rand)
  end

end
