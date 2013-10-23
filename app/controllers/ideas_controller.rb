class IdeasController < ApplicationController
  def edit
    @user = User.find(session[:user_id])
    user_id = session[:user_id]
    @entry = Entry.find(params[:entry_id])
    @idea = Idea.find(params[:idea_id])
  end

  def update

  end

end
