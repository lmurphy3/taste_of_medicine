require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:ingredient_health_benefits) }

    it { should have_many(:recipe_ingredients) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
