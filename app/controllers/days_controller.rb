class DaysController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @day = Day.new
  end

  def create
    week = Week.find(params[:week_id])
    day = week.days.build(day_params)
    @message = day.day
    day.save
    respond_to do |format|
      format.html {redirect_to weeks_path}
      format.js
    end
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
