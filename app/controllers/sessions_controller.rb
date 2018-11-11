class SessionsController < ApplicationController
  before_action :set_user_session, only: %w[new create]
  def new; end

  def create
    if @user_session.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    reset_current_user
    redirect_to root_path
  end

  private

  def set_user_session
    @user_session = UserSession.new(user_session_params)
  end

  def user_session_params
    tmp = params.fetch(:user_session, {}).permit(:username, :password, :password_confirmation)
    tmp
  end
end
