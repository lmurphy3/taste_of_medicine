class IngredientHealthBenefit < ApplicationRecord
  # Direct associations

  belongs_to :health_benefit

  belongs_to :ingredient

  # Indirect associations

  # Validations

end
