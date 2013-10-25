class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_user

  def get_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
