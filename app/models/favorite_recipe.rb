class FavoriteRecipe < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :recipe

  # Indirect associations

  # Validations

end
