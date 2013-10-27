class UsersController < ApplicationController
  def dashboard
    Time.zone = 'EST'
    #I need to establish the user
    user = User.find(session[:user_id])         #finds user for user's data retrieval
    @user_first_name = @user.name.split(' ')[0].capitalize
    @idea_objects_array = user.ideas            #finds all of a user's ideas
    entries = Entry.where(user_id: session[:user_id])     #grabs all of a users entries
    @most_recent_entries = entries.reverse!     #reverse order so most recent entries appear first in the array
  end

  def insight
    user = User.find(session[:user_id])
    #=======================================================
    professional_ideas = user.ideas.where(:category => 'professional') #creates an array of all the user's ideas of the 'professional' category. We'll iterate over this in a moment.
    professional_weight_average = professional_ideas.average('emotional_weight').to_f  #averages the emotional_weight of a user's entries in a particular category.

    if professional_weight_average                        #depending on the category's average emotional_weight, an insight_value (in this case, @professional_verdict) is assigned
      if professional_weight_average == -3
        @professional_verdict = 'universally distressing'
      end
      if professional_weight_average > -3 && professional_weight_average <= -1
        @professional_verdict = 'mostly distressing'
      end
      if professional_weight_average > -1 && professional_weight_average < 1
        @professional_verdict = 'approximately neutral'
      end
      if professional_weight_average >= 1 && professional_weight_average < 3
        @professional_verdict = 'mostly pleasant'
      end
      if professional_weight_average == 3
        @professional_verdict = 'universally pleasant'
      end
    end

    case @professional_verdict                            #depending on the insight_value (in this case, @professional_verdict), we set a @category_text_color instance variable, which will be interpolated into the html as a value for the "class" of an element. Each class can be found in the stylesheet, and renders any element of that class the colors (either red or green, depending on if the thoughts are distressing or plesant, respectively)
    when 'universally distressing'
      @professional_text_color = "bright-red"
    when 'mostly distressing'
      @professional_text_color = "slightly-red"
    when 'universally pleasant'
      @professional_text_color = "slightly-green"
    when 'mostly pleasant'
      @professional_text_color = "bright-green"
    else
      @professional_text_color = 'p'
    end

    #=======================================================
    personal_ideas = user.ideas.where(:category => 'personal')
    personal_weight_average = personal_ideas.average('emotional_weight').to_f


    if personal_weight_average
      if personal_weight_average == -3
        @personal_verdict = 'universally distressing'
      end

      if personal_weight_average > -3 && personal_weight_average <= -1
        @personal_verdict = 'mostly distressing'
      end

      if personal_weight_average > -1 && personal_weight_average < 1
        @personal_verdict = 'approximately neutral'
      end

      if personal_weight_average >= 1 && personal_weight_average < 3
        @personal_verdict = 'mostly pleasant'
      end

      if personal_weight_average == 3
        @personal_verdict = 'universally pleasant'
      end
    end

    case @personal_verdict
    when 'universally distressing'
      @personal_text_color = "bright-red"
    when 'mostly distressing'
      @personal_text_color = "slightly-red"
    when 'universally pleasant'
      @personal_text_color = "slightly-green"
    when 'mostly pleasant'
      @personal_text_color = "bright-green"
    else
      @personal_text_color = 'p'
    end


    #=======================================================
    societal_ideas = user.ideas.where(:category => 'societal')
    societal_weight_average = societal_ideas.average('emotional_weight').to_f

    if societal_weight_average
      if societal_weight_average == -3
        @societal_verdict = 'universally distressing'
      end

      if societal_weight_average > -3 && societal_weight_average <= -1
        @societal_verdict = 'mostly distressing'
      end

      if societal_weight_average > -1 && societal_weight_average < 1
        @societal_verdict = 'approximately neutral'
      end

      if societal_weight_average >= 1 && societal_weight_average < 3
        @societal_verdict = 'mostly pleasant'
      end

      if societal_weight_average == 3
        @societal_verdict = 'universally pleasant'
      end
    end

    case @societal_verdict
    when 'universally distressing'
      @societal_text_color = "bright-red"
    when 'mostly distressing'
      @societal_text_color = "slightly-red"
    when 'universally pleasant'
      @societal_text_color = "slightly-green"
    when 'mostly pleasant'
      @societal_text_color = "bright-green"
    else
      @societal_text_color = 'p'
    end

    #=======================================================
    other_ideas = user.ideas.where(:category => 'other')
    other_weight_average = other_ideas.average('emotional_weight').to_f

    if other_weight_average
      if other_weight_average == -3
        @other_verdict = 'universally distressing'
      end

      if other_weight_average > -3 && other_weight_average <= -1
        @other_verdict = 'mostly distressing'
      end

      if other_weight_average > -1 && other_weight_average < 1
        @other_verdict = 'approximately neutral'
      end

      if other_weight_average >= 1 && other_weight_average < 3
        @other_verdict = 'mostly pleasant'
      end

      if other_weight_average == 3
        @other_verdict = 'universally pleasant'
      end
    end

    case @other_verdict
    when 'universally distressing'
      @other_text_color = "bright-red"
    when 'mostly distressing'
      @other_text_color = "slightly-red"
    when 'universally pleasant'
      @other_text_color = "slightly-green"
    when 'mostly pleasant'
      @other_text_color = "bright-green"
    else
      @other_text_color = 'p'
    end

    #=========================================================
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
