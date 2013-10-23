class IdeasController < ApplicationController
  def edit
    @user = User.find(session[:user_id])
    user_id = session[:user_id]
    @entry = Entry.find(params[:entry_id])
    @idea = Idea.find(params[:idea_id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params[:idea])
      redirect_to "/users/#{session[:user_id]}/entries/#{params[:entry_id]}"
    else
      render :edit
    end
  end

end
