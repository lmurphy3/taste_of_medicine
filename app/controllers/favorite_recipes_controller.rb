class FavoriteRecipesController < ApplicationController
  before_action :current_user_must_be_favorite_recipe_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_favorite_recipe_user
    favorite_recipe = FavoriteRecipe.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == favorite_recipe.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @favorite_recipes = FavoriteRecipe.page(params[:page]).per(10)

    render("favorite_recipe_templates/index.html.erb")
  end

  def show
    @favorite_recipe = FavoriteRecipe.find(params.fetch("id_to_display"))

    render("favorite_recipe_templates/show.html.erb")
  end

  def new_form
    @favorite_recipe = FavoriteRecipe.new

    render("favorite_recipe_templates/new_form.html.erb")
  end

  def create_row
    @favorite_recipe = FavoriteRecipe.new

    @favorite_recipe.user_id = params.fetch("user_id")
    @favorite_recipe.recipe_id = params.fetch("recipe_id")

    if @favorite_recipe.valid?
      @favorite_recipe.save

      redirect_back(:fallback_location => "/favorite_recipes", :notice => "Favorite recipe created successfully.")
    else
      render("favorite_recipe_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_recipe
    @favorite_recipe = FavoriteRecipe.new

    @favorite_recipe.user_id = params.fetch("user_id")
    @favorite_recipe.recipe_id = params.fetch("recipe_id")

    if @favorite_recipe.valid?
      @favorite_recipe.save

      redirect_to("/recipes/#{@favorite_recipe.recipe_id}", notice: "FavoriteRecipe created successfully.")
    else
      render("favorite_recipe_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @favorite_recipe = FavoriteRecipe.find(params.fetch("prefill_with_id"))

    render("favorite_recipe_templates/edit_form.html.erb")
  end

  def update_row
    @favorite_recipe = FavoriteRecipe.find(params.fetch("id_to_modify"))

    
    @favorite_recipe.recipe_id = params.fetch("recipe_id")

    if @favorite_recipe.valid?
      @favorite_recipe.save

      redirect_to("/favorite_recipes/#{@favorite_recipe.id}", :notice => "Favorite recipe updated successfully.")
    else
      render("favorite_recipe_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_recipe
    @favorite_recipe = FavoriteRecipe.find(params.fetch("id_to_remove"))

    @favorite_recipe.destroy

    redirect_to("/recipes/#{@favorite_recipe.recipe_id}", notice: "FavoriteRecipe deleted successfully.")
  end

  def destroy_row_from_user
    @favorite_recipe = FavoriteRecipe.find(params.fetch("id_to_remove"))

    @favorite_recipe.destroy

    redirect_to("/users/#{@favorite_recipe.user_id}", notice: "FavoriteRecipe deleted successfully.")
  end

  def destroy_row
    @favorite_recipe = FavoriteRecipe.find(params.fetch("id_to_remove"))

    @favorite_recipe.destroy

    redirect_to("/favorite_recipes", :notice => "Favorite recipe deleted successfully.")
  end
end
