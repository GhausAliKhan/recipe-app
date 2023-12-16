class PublicRecipesController < ApplicationController
  include RecipesHelper
  def index
    @public_recipes = Recipe.where(public: true)
  end
end
