class CreateHealthBenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :health_benefits do |t|
      t.string :name

      t.timestamps
    end
  end
end
