class RecipeIngredientsController < ApplicationController
  def index
    @recipe_ingredients = RecipeIngredient.page(params[:page]).per(10)

    render("recipe_ingredient_templates/index.html.erb")
  end

  def show
    @recipe_ingredient = RecipeIngredient.find(params.fetch("id_to_display"))

    render("recipe_ingredient_templates/show.html.erb")
  end

  def new_form
    @recipe_ingredient = RecipeIngredient.new

    render("recipe_ingredient_templates/new_form.html.erb")
  end

  def create_row
    @recipe_ingredient = RecipeIngredient.new

    @recipe_ingredient.recipe_id = params.fetch("recipe_id")
    @recipe_ingredient.ingredient_id = params.fetch("ingredient_id")

    if @recipe_ingredient.valid?
      @recipe_ingredient.save

      redirect_back(:fallback_location => "/recipe_ingredients", :notice => "Recipe ingredient created successfully.")
    else
      render("recipe_ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_recipe
    @recipe_ingredient = RecipeIngredient.new

    @recipe_ingredient.recipe_id = params.fetch("recipe_id")
    @recipe_ingredient.ingredient_id = params.fetch("ingredient_id")

    if @recipe_ingredient.valid?
      @recipe_ingredient.save

      redirect_to("/recipes/#{@recipe_ingredient.recipe_id}", notice: "RecipeIngredient created successfully.")
    else
      render("recipe_ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_ingredient
    @recipe_ingredient = RecipeIngredient.new

    @recipe_ingredient.recipe_id = params.fetch("recipe_id")
    @recipe_ingredient.ingredient_id = params.fetch("ingredient_id")

    if @recipe_ingredient.valid?
      @recipe_ingredient.save

      redirect_to("/ingredients/#{@recipe_ingredient.ingredient_id}", notice: "RecipeIngredient created successfully.")
    else
      render("recipe_ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @recipe_ingredient = RecipeIngredient.find(params.fetch("prefill_with_id"))

    render("recipe_ingredient_templates/edit_form.html.erb")
  end

  def update_row
    @recipe_ingredient = RecipeIngredient.find(params.fetch("id_to_modify"))

    @recipe_ingredient.recipe_id = params.fetch("recipe_id")
    @recipe_ingredient.ingredient_id = params.fetch("ingredient_id")

    if @recipe_ingredient.valid?
      @recipe_ingredient.save

      redirect_to("/recipe_ingredients/#{@recipe_ingredient.id}", :notice => "Recipe ingredient updated successfully.")
    else
      render("recipe_ingredient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_recipe
    @recipe_ingredient = RecipeIngredient.find(params.fetch("id_to_remove"))

    @recipe_ingredient.destroy

    redirect_to("/recipes/#{@recipe_ingredient.recipe_id}", notice: "RecipeIngredient deleted successfully.")
  end

  def destroy_row_from_ingredient
    @recipe_ingredient = RecipeIngredient.find(params.fetch("id_to_remove"))

    @recipe_ingredient.destroy

    redirect_to("/ingredients/#{@recipe_ingredient.ingredient_id}", notice: "RecipeIngredient deleted successfully.")
  end

  def destroy_row
    @recipe_ingredient = RecipeIngredient.find(params.fetch("id_to_remove"))

    @recipe_ingredient.destroy

    redirect_to("/recipe_ingredients", :notice => "Recipe ingredient deleted successfully.")
  end
end
