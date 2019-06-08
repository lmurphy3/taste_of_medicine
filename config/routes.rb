Rails.application.routes.draw do
  root :to => "recipes#index"
  # Routes for the Ingredient health benefit resource:

  # CREATE
  get("/ingredient_health_benefits/new", { :controller => "ingredient_health_benefits", :action => "new_form" })
  post("/create_ingredient_health_benefit", { :controller => "ingredient_health_benefits", :action => "create_row" })

  # READ
  get("/ingredient_health_benefits", { :controller => "ingredient_health_benefits", :action => "index" })
  get("/ingredient_health_benefits/:id_to_display", { :controller => "ingredient_health_benefits", :action => "show" })

  # UPDATE
  get("/ingredient_health_benefits/:prefill_with_id/edit", { :controller => "ingredient_health_benefits", :action => "edit_form" })
  post("/update_ingredient_health_benefit/:id_to_modify", { :controller => "ingredient_health_benefits", :action => "update_row" })

  # DELETE
  get("/delete_ingredient_health_benefit/:id_to_remove", { :controller => "ingredient_health_benefits", :action => "destroy_row" })

  #------------------------------

  # Routes for the Recipe ingredient resource:

  # CREATE
  get("/recipe_ingredients/new", { :controller => "recipe_ingredients", :action => "new_form" })
  post("/create_recipe_ingredient", { :controller => "recipe_ingredients", :action => "create_row" })

  # READ
  get("/recipe_ingredients", { :controller => "recipe_ingredients", :action => "index" })
  get("/recipe_ingredients/:id_to_display", { :controller => "recipe_ingredients", :action => "show" })

  # UPDATE
  get("/recipe_ingredients/:prefill_with_id/edit", { :controller => "recipe_ingredients", :action => "edit_form" })
  post("/update_recipe_ingredient/:id_to_modify", { :controller => "recipe_ingredients", :action => "update_row" })

  # DELETE
  get("/delete_recipe_ingredient/:id_to_remove", { :controller => "recipe_ingredients", :action => "destroy_row" })

  #------------------------------

  # Routes for the Favorite recipe resource:

  # CREATE
  get("/favorite_recipes/new", { :controller => "favorite_recipes", :action => "new_form" })
  post("/create_favorite_recipe", { :controller => "favorite_recipes", :action => "create_row" })

  # READ
  get("/favorite_recipes", { :controller => "favorite_recipes", :action => "index" })
  get("/favorite_recipes/:id_to_display", { :controller => "favorite_recipes", :action => "show" })

  # UPDATE
  get("/favorite_recipes/:prefill_with_id/edit", { :controller => "favorite_recipes", :action => "edit_form" })
  post("/update_favorite_recipe/:id_to_modify", { :controller => "favorite_recipes", :action => "update_row" })

  # DELETE
  get("/delete_favorite_recipe/:id_to_remove", { :controller => "favorite_recipes", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Health benefit resource:

  # CREATE
  get("/health_benefits/new", { :controller => "health_benefits", :action => "new_form" })
  post("/create_health_benefit", { :controller => "health_benefits", :action => "create_row" })

  # READ
  get("/health_benefits", { :controller => "health_benefits", :action => "index" })
  get("/health_benefits/:id_to_display", { :controller => "health_benefits", :action => "show" })

  # UPDATE
  get("/health_benefits/:prefill_with_id/edit", { :controller => "health_benefits", :action => "edit_form" })
  post("/update_health_benefit/:id_to_modify", { :controller => "health_benefits", :action => "update_row" })

  # DELETE
  get("/delete_health_benefit/:id_to_remove", { :controller => "health_benefits", :action => "destroy_row" })

  #------------------------------

  # Routes for the Ingredient resource:

  # CREATE
  get("/ingredients/new", { :controller => "ingredients", :action => "new_form" })
  post("/create_ingredient", { :controller => "ingredients", :action => "create_row" })

  # READ
  get("/ingredients", { :controller => "ingredients", :action => "index" })
  get("/ingredients/:id_to_display", { :controller => "ingredients", :action => "show" })

  # UPDATE
  get("/ingredients/:prefill_with_id/edit", { :controller => "ingredients", :action => "edit_form" })
  post("/update_ingredient/:id_to_modify", { :controller => "ingredients", :action => "update_row" })

  # DELETE
  get("/delete_ingredient/:id_to_remove", { :controller => "ingredients", :action => "destroy_row" })

  #------------------------------

  # Routes for the Recipe resource:

  # CREATE
  get("/recipes/new", { :controller => "recipes", :action => "new_form" })
  post("/create_recipe", { :controller => "recipes", :action => "create_row" })

  # READ
  get("/recipes", { :controller => "recipes", :action => "index" })
  get("/recipes/:id_to_display", { :controller => "recipes", :action => "show" })

  # UPDATE
  get("/recipes/:prefill_with_id/edit", { :controller => "recipes", :action => "edit_form" })
  post("/update_recipe/:id_to_modify", { :controller => "recipes", :action => "update_row" })

  # DELETE
  get("/delete_recipe/:id_to_remove", { :controller => "recipes", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
