class FoodsController < ApplicationController
  def index
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Great, you have a new food!'
    else
      redirect_to foods_path, notice: 'Food not saved!'
    end
  end
end
