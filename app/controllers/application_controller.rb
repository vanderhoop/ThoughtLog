class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_user, :set_time_zone                #this ensures that the get_user method, outlined below, gives us an @user instance variable we can use in any of the controllers or views in our project.

  def get_user
    if session[:user_id]
      @user = User.find(session[:user_id])  #gives us an @user instance variable in any of the controllers or views in our project.
    end
  end

  def set_time_zone
    Time.zone = 'EST'
  end


end
