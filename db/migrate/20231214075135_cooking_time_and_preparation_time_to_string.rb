class CookingTimeAndPreparationTimeToString < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :preparation_time, :string
    change_column :recipes, :cooking_time, :string
  end
end
