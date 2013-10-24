class UsersController < ApplicationController
  def dashboard
    Time.zone = 'EST'
    #I need to establish the user
    user = User.find(session[:user_id])         #finds user for user's data retrieval
    @idea_objects_array = user.ideas            #finds all of a user's ideas
    entries = Entry.where(user_id: session[:user_id])     #grabs all of a users entries
    @most_recent_entries = entries.reverse!     #reverse order so most recent entries appear first in the array
  end

  def insights
    user = User.find(session[:user_id])
    #=======================================================
    professional_emotional_weight = 0
    professional_ideas = user.ideas.where(:category => 'professional')

    professional_ideas.each do |professional_idea|
      professional_emotional_weight += professional_idea.emotional_weight
    end

    if professional_emotional_weight != 0 &&
      professional_weight_average = professional_emotional_weight/professional_ideas.size
    end
    #=======================================================
    personal_emotional_weight = 0
    personal_ideas = user.ideas.where(:category => 'personal')

    personal_ideas.each do |personal_idea|
      personal_emotional_weight += personal_idea.emotional_weight
    end
    #=======================================================
    societal_emotional_weight = 0
    societal_ideas = user.ideas.where(:category => 'societal')

    societal_ideas.each do |societal_idea|
      societal_emotional_weight += societal_idea.emotional_weight
    end
    #=======================================================
    other_emotional_weight = 0
    other_ideas = user.ideas.where(:category => 'other')

    other_ideas.each do |other_idea|
      other_emotional_weight += other_idea.emotional_weight
    end

    raise



    raise
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
