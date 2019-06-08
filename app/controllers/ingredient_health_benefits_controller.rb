class IngredientHealthBenefitsController < ApplicationController
  def index
    @ingredient_health_benefits = IngredientHealthBenefit.all

    render("ingredient_health_benefit_templates/index.html.erb")
  end

  def show
    @ingredient_health_benefit = IngredientHealthBenefit.find(params.fetch("id_to_display"))

    render("ingredient_health_benefit_templates/show.html.erb")
  end

  def new_form
    @ingredient_health_benefit = IngredientHealthBenefit.new

    render("ingredient_health_benefit_templates/new_form.html.erb")
  end

  def create_row
    @ingredient_health_benefit = IngredientHealthBenefit.new

    @ingredient_health_benefit.ingredient_id = params.fetch("ingredient_id")
    @ingredient_health_benefit.health_benefit_id = params.fetch("health_benefit_id")

    if @ingredient_health_benefit.valid?
      @ingredient_health_benefit.save

      redirect_back(:fallback_location => "/ingredient_health_benefits", :notice => "Ingredient health benefit created successfully.")
    else
      render("ingredient_health_benefit_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_ingredient
    @ingredient_health_benefit = IngredientHealthBenefit.new

    @ingredient_health_benefit.ingredient_id = params.fetch("ingredient_id")
    @ingredient_health_benefit.health_benefit_id = params.fetch("health_benefit_id")

    if @ingredient_health_benefit.valid?
      @ingredient_health_benefit.save

      redirect_to("/ingredients/#{@ingredient_health_benefit.ingredient_id}", notice: "IngredientHealthBenefit created successfully.")
    else
      render("ingredient_health_benefit_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_health_benefit
    @ingredient_health_benefit = IngredientHealthBenefit.new

    @ingredient_health_benefit.ingredient_id = params.fetch("ingredient_id")
    @ingredient_health_benefit.health_benefit_id = params.fetch("health_benefit_id")

    if @ingredient_health_benefit.valid?
      @ingredient_health_benefit.save

      redirect_to("/health_benefits/#{@ingredient_health_benefit.health_benefit_id}", notice: "IngredientHealthBenefit created successfully.")
    else
      render("ingredient_health_benefit_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ingredient_health_benefit = IngredientHealthBenefit.find(params.fetch("prefill_with_id"))

    render("ingredient_health_benefit_templates/edit_form.html.erb")
  end

  def update_row
    @ingredient_health_benefit = IngredientHealthBenefit.find(params.fetch("id_to_modify"))

    @ingredient_health_benefit.ingredient_id = params.fetch("ingredient_id")
    @ingredient_health_benefit.health_benefit_id = params.fetch("health_benefit_id")

    if @ingredient_health_benefit.valid?
      @ingredient_health_benefit.save

      redirect_to("/ingredient_health_benefits/#{@ingredient_health_benefit.id}", :notice => "Ingredient health benefit updated successfully.")
    else
      render("ingredient_health_benefit_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_ingredient
    @ingredient_health_benefit = IngredientHealthBenefit.find(params.fetch("id_to_remove"))

    @ingredient_health_benefit.destroy

    redirect_to("/ingredients/#{@ingredient_health_benefit.ingredient_id}", notice: "IngredientHealthBenefit deleted successfully.")
  end

  def destroy_row_from_health_benefit
    @ingredient_health_benefit = IngredientHealthBenefit.find(params.fetch("id_to_remove"))

    @ingredient_health_benefit.destroy

    redirect_to("/health_benefits/#{@ingredient_health_benefit.health_benefit_id}", notice: "IngredientHealthBenefit deleted successfully.")
  end

  def destroy_row
    @ingredient_health_benefit = IngredientHealthBenefit.find(params.fetch("id_to_remove"))

    @ingredient_health_benefit.destroy

    redirect_to("/ingredient_health_benefits", :notice => "Ingredient health benefit deleted successfully.")
  end
end
