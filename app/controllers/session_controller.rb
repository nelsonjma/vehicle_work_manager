class SessionController < ApplicationController

  include SessionHelper

  def new

  end

  def create
    pin = params[:pin]

    user = User.authenticate(pin)

    begin
      raise 'Login invalido' unless user

      build_user_session(user.id)

      redirect_to vehicles_path
    rescue Exception => ex
      redirect_to login_path, alert: ex.message
    end

  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'Logout com sucesso'
  end

end
