class IdeasController < ApplicationController
  def edit
    user_id = session[:user_id]
    @entry = Entry.find(params[:entry_id])
    @idea = Idea.find(params[:idea_id])
  end

  def update
    params[:idea][:category] = params[:category]                #I needed to set the these manually, so that when I run .update_attributes below, the hash at params[:idea], which I will pass to the updates_attributes method, includes category and emotional_weight. The reason I believe it wasn't working before is that I didn't use the form_for syntax for the category and emotional_weight selectors (instead, I hard coded the html), and the form_for sets things to go into the params[:idea] hash.
    params[:idea][:emotional_weight] = params[:emotional_weight]
    @idea = Idea.find(params[:id])
    if @idea.update_attributes(params[:idea])
      redirect_to "/users/#{session[:user_id]}/entries/#{params[:entry_id]}"
    else
      render :edit
    end
  end

end
