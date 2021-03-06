class WeeksController < ApplicationController

  #layout false

  def index
    @weeks = Week.all.where(user: current_user.username)
  end

  def my_weeks
    @weeks = Week.all.where(:user => params[:user]).order("id asc")
  end

  def my_fav
    @recipes = Recipe.all.where(:user => params[:user]).order("id asc")
    respond_to do |format|
      format.html
      format.js
    end
  end

  def reset_days
    i = Week.find_by_id(params[:id]).days.count
    week = Week.find_by_id(params[:id])
    i.times do
      week.days.last.destroy
    end
    redirect_to(:action => 'index')
  end

  def comments
    @comments = Comment.all.where(:recipe_id => params[:id])
  end

  def rating
    rating = Week.find_by_id(params[:id]).rating
    final_rating = (rating+(params[:new_rating].to_i))/2
    final_rating = final_rating.to_i
    Week.find_by_id(params[:id]).update_attributes(:rating => final_rating)
    @rating = final_rating
  end

  def search
    @search_rating = Week.where(search_rating)
    @search_tags = Week.where(search_tags)
    @search_ready_in = Week.where(search_ready_in)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show_iPad
    @week = Week.find_by_id(params[:id])
    @favorites = FavRecipe.all.where(:user => current_user.username)
    @vegetarians = Recipe.all.where(:tags => 'vegetarian')
  end

  def show
    @week = Week.find_by_id(params[:id])
    @favorites = FavRecipe.all.where(:user => current_user.username)
    @vegetarians = Recipe.all.where(:tags => 'vegetarian')
    if @week.days.count >= 7
      @full = 'yes'
    else
      @full = 'no'
    end
    respond_to do |format|
      format.html # show.html.haml
      format.js # show.js.erb
    end
  end

  def new
    @week = Week.new
  end

  def create
    @week = Week.new(week_params)
    if @week.save
      redirect_to(:action => 'show', :id => @week.id)
    else
      render('new')
    end
  end

  def edit
    @week = Week.find_by_id(params[:id])
  end

  def update
    @week = Week.find(params[:id])
    if @week.update_attributes(week_params)
      flash[:notice] = "Week updated successfully"
      redirect_to(:action => 'show', :id => @week.id)
    else
      render('edit')
    end
  end

  def delete
    @week = Week.find_by_id(params[:id])
  end

  def destroy
    week = Week.find_by_id(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private

  def week_params
    params.require(:week).permit(:week_date, :user)
  end


end
