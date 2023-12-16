module RecipesHelper
    def recipe_total_amount(recipe)
      total_amount = 0
  
      recipe.recipe_foods.each do |recipe_food|
        total_amount += recipe_food.quantity * recipe_food.food.price
      end
  
      total_amount
    end
  end
  