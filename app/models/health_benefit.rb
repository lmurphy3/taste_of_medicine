class HealthBenefit < ApplicationRecord
  # Direct associations

  has_many   :ingredient_health_benefits,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
