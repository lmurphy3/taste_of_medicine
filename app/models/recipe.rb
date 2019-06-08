class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :recipe_ingredients,
             :dependent => :destroy

  has_many   :favorite_recipes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
