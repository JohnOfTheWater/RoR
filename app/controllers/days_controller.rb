class DaysController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @day = Day.new
  end

  def create
    week = Week.find(params[:week_id])
    day = week.days.build(day_params)
    if day.save
      flash[:notice] = "Your day has been created"
    else
      flash[:alert] = "Your comment could not be created"
    end
    redirect_to weeks_path
    #render :js => "window.location = '/jobs/index'"
  end

  def show
    @recipe = Recipe.find_by_recipe_name(params[:recipe_name])
    redirect_to(:controller => 'Recipes', :action => 'show', :id => @recipe.id)
  end

  private

  def day_params
    params.require(:day).permit(:day, :week_id, :recipe_name, :description, :tags, :image)
  end
end
