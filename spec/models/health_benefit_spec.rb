require 'rails_helper'

RSpec.describe HealthBenefit, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:ingredient_health_benefits) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
