class RecipesController < ApplicationController

  #layout false

  def index
    @recipes = Recipe.all.order("id asc")
  end

  def my_recipes
    @recipes = Recipe.all.where(:user => params[:user]).order("id asc")
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
  end

  def update
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:notice] = "Recipe updated successfully"
      redirect_to(:action => 'show', :id => @recipe.id)
    else
      render('edit')
    end
  end

  def delete
    @recipe = Recipe.find_by_id(params[:id])
  end

  def destroy
    recipe = Recipe.find_by_id(params[:id]).destroy
    flash[:notice] = "Recipe '#{recipe.recipe_name}'  destroyed successfully"
    redirect_to(:action => 'index')
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :description, :preparation, :tags, :user)
  end




end
