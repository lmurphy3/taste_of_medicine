require 'rails_helper'

RSpec.describe IngredientHealthBenefit, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:health_benefit) }

    it { should belong_to(:ingredient) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
