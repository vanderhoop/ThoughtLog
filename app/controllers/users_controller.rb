class UsersController < ApplicationController
  def dashboard
    Time.zone = 'EST'
    #I need to establish the user
    user = User.find(session[:user_id])         #finds user for user's data retrieval
    @idea_objects_array = user.ideas            #finds all of a user's ideas
    entries = Entry.where(user_id: session[:user_id])     #grabs all of a users entries
    @most_recent_entries = entries.reverse!     #reverse order so most recent entries appear first in the array
  end

  def index
    @users = User.all
  end

  def new
    # render users/new signup form
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(login_path)
    else
      # go to users/new.html.erb and just display that page.
      # in this action
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    render :new
  end
end
