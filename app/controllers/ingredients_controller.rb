class IngredientsController < ApplicationController
  def index
    @q = Ingredient.ransack(params[:q])
    @ingredients = @q.result(:distinct => true).includes(:recipe_ingredients, :ingredient_health_benefits).page(params[:page]).per(10)

    render("ingredient_templates/index.html.erb")
  end

  def show
    @ingredient_health_benefit = IngredientHealthBenefit.new
    @recipe_ingredient = RecipeIngredient.new
    @ingredient = Ingredient.find(params.fetch("id_to_display"))

    render("ingredient_templates/show.html.erb")
  end

  def new_form
    @ingredient = Ingredient.new

    render("ingredient_templates/new_form.html.erb")
  end

  def create_row
    @ingredient = Ingredient.new

    @ingredient.name = params.fetch("name")

    if @ingredient.valid?
      @ingredient.save

      redirect_back(:fallback_location => "/ingredients", :notice => "Ingredient created successfully.")
    else
      render("ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ingredient = Ingredient.find(params.fetch("prefill_with_id"))

    render("ingredient_templates/edit_form.html.erb")
  end

  def update_row
    @ingredient = Ingredient.find(params.fetch("id_to_modify"))

    @ingredient.name = params.fetch("name")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/ingredients/#{@ingredient.id}", :notice => "Ingredient updated successfully.")
    else
      render("ingredient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @ingredient = Ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/ingredients", :notice => "Ingredient deleted successfully.")
  end
end
