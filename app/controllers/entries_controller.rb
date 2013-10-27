class EntriesController < ApplicationController
  def index
    @user_first_name = @user.name.split(' ')[0].capitalize     #Grabs and capitalizes the first name of the user
    @user_entries = Entry.where(user_id: session[:user_id]).order("created_at DESC") #grabs all of a users entries and orders them by their date of creation (in descending order)
    # @user_entries = Entry.where(user_id: params[:user_id])
    #TRAVIS, with the help of the ApplicationController's get_user method, you should just be able to call @user.entries in the above line
  end

  def show
    user = User.find(params[:user_id])
    @entry_ideas = user.ideas.where(entry_id: params[:id])
    @entry = Entry.find(params[:id])
  end

  def new
    # render entries/new entry form
    @prompts = ["Think of a time you learned something from or came to an
agreement with someone you disliked.", "What would it be like to have yourself as a spouse?", "What would you say to your 16-year old self if you couldn't explain who you were?", "If you had no restrictions whatsoever, what 9-to-5 job would you have?", "Would you say routine makes your job better or worse?", "What surprised you about today? It can be anything at all, even a nice hello.", "Think of something you spent weeks anticipating only to be disappointed. How do you feel about that disappointment now?", "If you had to give the sky a new color, what color would you choose? And who does this color remind you of?", "Write about your family. Whatever comes to mind."]
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
    @entry = @user.entries.build              #my categorie and :emotional_weight edits aren't persisted in the database. Why is that?
  end

  def destroy
    #I want to destroy all entries associated with this entry.
    #This code works, but I used a 'link_to' in the view, when Stack Overflowers recommend using a 'button_to'. Link_to defaults to a 'GET' method, while button_to defaults to a 'POST' method.
    @user = User.find(params[:user_id])
    @entry_ideas = @user.ideas.where(entry_id: params[:id])
    @entry_ideas.each { |idea| idea.destroy }
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to "/users/#{params[:user_id]}/entries"
  end
end

