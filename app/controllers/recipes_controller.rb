class RecipesController < ApplicationController

  #layout false

  def index
    @recipes = Recipe.all.order("id asc")
  end

  def my_recipes
    @recipes = Recipe.all.where(:user => params[:user]).order("id asc")
  end

  def comments
    @comments = Comment.all.where(:recipe_id => params[:id])
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
    if Comment.all.where(:recipe_id => params[:id])[-1] == nil
      @comments = 'no comments'
      @commenter = ''
      @commenter_pic = ''
    else
      @comments = Comment.all.where(:recipe_id => params[:id])[-1].comment
      @commenter = Comment.all.where(:recipe_id => params[:id])[-1].username
      @commenter_pic = Comment.all.where(:recipe_id => params[:id])[-1].user_image
    end
    @ingredients = Recipe.find_by_id(params[:id]).ingredients.split('-')[1..-1]
    respond_to do |format|
      format.html # show.html.haml
      format.js # show.js.erb
    end
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
    @recipe = Recipe.find(params[:id])
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
    params.require(:recipe).permit(:recipe_name, :description, :ingredients, :preparation, :tags, :user, :image, :rating, :favorite, :commented, :servings, :ready_in)
  end




end
