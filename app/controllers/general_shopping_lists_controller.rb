class GeneralShoppingListsController < ApplicationController
  def index
    # Fetch all recipes of the logged-in user
    user_recipes = current_user.recipes.includes(:food_items)

    # Calculate the list of missing food items
    missing_food_items = []
    user_recipes.each do |recipe|
      recipe.food_items.each do |food_item|
        # Check if the food item is not in the user's general food list
        missing_food_items << food_item unless current_user.foods.exists?(food_item.id)
      end
    end

    # Calculate the total count and price of missing food items
    total_missing_items = missing_food_items.count
    total_missing_price = missing_food_items.sum(&:price)

    render locals: {
      missing_food_items:,
      total_missing_items:,
      total_missing_price:
    }
  end
end
