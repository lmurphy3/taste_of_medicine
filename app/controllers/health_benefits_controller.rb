class HealthBenefitsController < ApplicationController
  def index
    @q = HealthBenefit.ransack(params[:q])
    @health_benefits = @q.result(:distinct => true).includes(:ingredient_health_benefits).page(params[:page]).per(10)

    render("health_benefit_templates/index.html.erb")
  end

  def show
    @ingredient_health_benefit = IngredientHealthBenefit.new
    @health_benefit = HealthBenefit.find(params.fetch("id_to_display"))

    render("health_benefit_templates/show.html.erb")
  end

  def new_form
    @health_benefit = HealthBenefit.new

    render("health_benefit_templates/new_form.html.erb")
  end

  def create_row
    @health_benefit = HealthBenefit.new

    @health_benefit.name = params.fetch("name")

    if @health_benefit.valid?
      @health_benefit.save

      redirect_back(:fallback_location => "/health_benefits", :notice => "Health benefit created successfully.")
    else
      render("health_benefit_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @health_benefit = HealthBenefit.find(params.fetch("prefill_with_id"))

    render("health_benefit_templates/edit_form.html.erb")
  end

  def update_row
    @health_benefit = HealthBenefit.find(params.fetch("id_to_modify"))

    @health_benefit.name = params.fetch("name")

    if @health_benefit.valid?
      @health_benefit.save

      redirect_to("/health_benefits/#{@health_benefit.id}", :notice => "Health benefit updated successfully.")
    else
      render("health_benefit_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @health_benefit = HealthBenefit.find(params.fetch("id_to_remove"))

    @health_benefit.destroy

    redirect_to("/health_benefits", :notice => "Health benefit deleted successfully.")
  end
end
