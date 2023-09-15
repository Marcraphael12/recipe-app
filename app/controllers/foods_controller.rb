class FoodsController < ApplicationController
  # Other actions

  def index
    @food = Food.new
    @foods = current_user.foods
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Great, you have a new food!'
    else
      render :index
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :description, :other_attributes)
  end
end
