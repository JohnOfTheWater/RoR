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

  def rating
    rating = Recipe.find_by_id(params[:id]).rating
    final_rating = (rating+(params[:new_rating].to_i))/2
    final_rating = final_rating.to_i
    Recipe.find_by_id(params[:id]).update_attributes(:rating => final_rating)
    @rating = final_rating
  end

  def search_menu
  end

  def search
    if Recipe.find_by_rating(params[:rating]) == nil
      @search_rating = 'no match'
    else
      @search_rating = Recipe.find_by_rating(params[:rating])
    end
    #@search_tags = Recipe.find_by_tags(params[:tags])
    #@search_ready_in = Recipe.find_by_ready_in(params[:ready_in])
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
    if FavRecipe.find_by_id(params[:id]) == nil
      @favorite = 'no'
    else
      @favorite = 'yes'
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

  def add_to_fav
    recipe = Recipe.find_by_id(params[:id]).update_attributes(:favorite => "yes")
    @recipe = Recipe.find_by_id(params[:id])
    @image = Recipe.find_by_id(params[:id]).image
    fav_recipe = FavRecipe.create
    fav_recipe.update_attributes(:favorite => "yes")
    fav_recipe.update_attributes(:id => (params[:id]))
    fav_recipe.update_attributes(:tags => (params[:tags]))
    fav_recipe.update_attributes(:user => (params[:username]))
    fav_recipe.update_attributes(:recipe_name => (params[:recipe_name]))
    fav_recipe.update_attributes(:image => (@image))
    fav_recipe.update_attributes(:description => (params[:description]))
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
    @recipe = Recipe.find_by_id(params[:id])
  end

  def destroy
    recipe = Recipe.find_by_id(params[:id]).destroy
    flash[:notice] = "Recipe '#{recipe.recipe_name}' destroyed successfully"
    redirect_to(:action => 'index')
  end

  private

  def recipe_params
    params.require(:recipe).permit(:recipe_name, :description, :ingredients, :preparation, :tags, :user, :image, :rating, :favorite, :commented, :servings, :ready_in)
  end




end
