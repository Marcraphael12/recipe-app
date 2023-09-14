class RecipesController < ApplicationController
  def index
    # checking if the `current_user` is
    # truthy. If it is truthy, it means that the user is currently logged in. In that case, the code
    # will not execute the `redirect_to` method.
    redirect_to current_user_path unless current_user

    @recipes = current_user.recipes
  end

  def show
  end
end
