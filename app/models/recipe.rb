class Recipe < ApplicationRecord
  # Direct associations

  has_many   :favorite_recipes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
