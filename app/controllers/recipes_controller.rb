class RecipesController < ApplicationController
  def index
    # checking if the `current_user` is
    # truthy. If it is truthy, it means that the user is currently logged in. In that case, the code
    # will not execute the `redirect_to` method.
    redirect_to current_user_path unless current_user

    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.includes(:foods).find(params[:id])
  end

  def new
    @recipes = Recipe.new
  end

  def create
    redirect_to public_recipes_path unless current_user

    recipe = Recipe.new(required_params)

    if recipe.save
      redirect_to recipe_path(recipe.id), notice: 'Great, you added a new recipe!'
    else
      redirect_to new_recipe_path, notice: 'Sorry, could not create your recipe!'
    end
  end

  def required_params
    params.require(:recipe).permit(:name, :user_id, :preparation_time, :cooking_time, :description, :public)
  end
end
