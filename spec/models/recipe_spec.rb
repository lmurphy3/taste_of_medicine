require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:recipe_ingredients) }

    it { should have_many(:favorite_recipes) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
