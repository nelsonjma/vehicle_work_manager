class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  protected

  ###############################################################
  helper_method :current_user

  def current_user
    #(session[:user_id] && session_in_time?) ? User.find_by_id(session[:user_id]) : nil

    return nil unless session[:user_id] && session_in_time?

    refresh_session_time
    return User.find_by_id(session[:user_id])
  end

  ###############################################################
  def authenticated
    logged_in? || access_denied
  end

  ###############################################################
  def generic_form_error_hander(format, title, messages)
    @error_title    = title
    @error_messages = messages

    format.js   { render :template => 'layouts/generic_form_error.js.erb', :layout => false }
  end

end
