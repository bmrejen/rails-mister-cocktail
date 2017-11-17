class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    #cuz we want to get the cocktail id
    @ingredients = Ingredient.all
  end

  def edit
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update(dose_params)
    redirect_to cocktail_path(@dose.cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose)
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

# controllers are independent. The MODELS will nest information
