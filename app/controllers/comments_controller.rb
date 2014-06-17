class CommentsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    comment = recipe.comments.build(comment_params)
    Recipe.find(params[:recipe_id]).update_attributes(:commented => 'yes')
    comment.user = current_user
    if comment.save
      flash[:notice] = "Your comment has been created"
    else
      flash[:alert] = "Your comment could not be created"
    end
    redirect_to recipe_path (recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :recipe_id, :user_id, :username, :user_image)
  end
end
