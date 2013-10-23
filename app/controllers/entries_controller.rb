class EntriesController < ApplicationController
  def index
    Time.zone = 'EST'
    #I need to establish the user
    @user = User.find(params[:user_id])
    @user_first_name = @user.name.split(' ')[0].capitalize     #Grabs and capitalizes the first name of the user
    @user_entries = Entry.where(user_id: params[:user_id])
  end

  def show
    Time.zone = 'EST'
    user = User.find(params[:user_id])
    @entry_ideas = user.ideas.where(entry_id: params[:id])
    @entry = Entry.find(params[:id])
  end

  def new
    # render entries/new entry form
    @user = User.find(params[:user_id])
    @entry = @user.entries.build
  end

  # POST /entries
  def create
    #TODO: Flash messages
    entry = Entry.new
    entry.user_id = session[:user_id]
    entry.save                                  #creates Entry and assigns it to the correct user

    idea1 = Idea.new
    idea1.idea_text = params[:idea1_text]                       #takes the idea1_text input and assigns it to the idea.
    idea1.category = params[:idea1_category]                    #takes the idea1_category input and assigns it to the idea
    idea1.emotional_weight = params[:idea1_emotional_weight]    #takes the idea1_emotional_weight input and assigns it to the idea

    idea2 = Idea.new
    idea2.idea_text = params[:idea2_text]
    idea2.category = params[:idea2_category]
    idea2.emotional_weight = params[:idea2_emotional_weight]

    idea3 = Idea.new
    idea3.idea_text = params[:idea3_text]
    idea3.category = params[:idea3_category]
    idea3.emotional_weight = params[:idea3_emotional_weight]

    entry.ideas << idea1 << idea2 << idea3
    redirect_to :user_entries
  end

  def edit
    @user = User.find(params[:user_id])
    @entry = @user.entries.build
  end

  def destroy
    #I want to destroy all entries associated with this entry.
    #This code works, but I used a 'link_to' in the view, when Stack Overflowers recommend using a 'button_to'
    @user = User.find(params[:user_id])
    @entry_ideas = @user.ideas.where(entry_id: params[:id])
    @entry_ideas.each { |idea| idea.destroy }
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to "/users/#{params[:user_id]}/entries"
  end
end

