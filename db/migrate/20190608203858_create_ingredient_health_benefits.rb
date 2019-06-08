class CreateIngredientHealthBenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_health_benefits do |t|
      t.integer :ingredient_id
      t.integer :health_benefit_id

      t.timestamps
    end
  end
end
