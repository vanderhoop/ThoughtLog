class SessionController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]                  #
    @user = User.where(email: email).first        #what does user.authenticate mean, exacty?
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}/dashboard")
      #redirect_to(@user/dashboard)                 #test this code. does it actually work if I comment out the line above it?
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil      #ends the user's session
    flash[:notice] = "You've been signed out." #sets message to render in application.html.erb if this action is prompted.
    redirect_to '/login'              #sends homeboy back to login after signing out.
  end

end
