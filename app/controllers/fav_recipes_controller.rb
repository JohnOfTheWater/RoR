class FavRecipesController < ApplicationController
  #layout false

  def index
    @recipes = FavRecipe.where(:user => params[:user])
  end

  def my_fav_recipes
    @recipes = FavRecipe.all.where(:user => params[:user]).order("id asc")
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
    @recipe = FavRecipe.new
  end

  def create
    @recipe = FavRecipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @recipe = FavRecipe.find_by_id(params[:id])
  end

  def update
    @recipe = FavRecipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:notice] = "Recipe updated successfully"
      redirect_to(:action => 'show', :id => @recipe.id)
    else
      render('edit')
    end
  end

  def add_to_fav
    recipe = FavRecipe.find_by_id(params[:id]).update_attributes(:favorite => "yes")
    @id = FavRecipe.find_by_id(params[:id]).id
    respond_to do |format|
      format.html
      format.js
    end
  end

  def remove_from_fav
    recipe = Recipe.find_by_id(params[:id]).update_attributes(:favorite => "no")
    fav_recipe = FavRecipe.where(:id => params[:id], :user => params[:username])[0]
    fav_recipe.destroy
    @recipe = Recipe.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def delete
    @recipe = FavRecipe.find_by_id(params[:id])
  end

  def destroy
    recipe = FavRecipe.find_by_id(params[:id]).destroy
    flash[:notice] = "Recipe '#{recipe.recipe_name}'  destroyed successfully"
    redirect_to(:action => 'index')
  end

  private

  def recipe_params
    params.require(:fav_recipe).permit(:recipe_name, :description, :ingredients, :preparation, :tags, :user, :image, :rating, :favorite, :commented, :servings, :ready_in)
  end

end
