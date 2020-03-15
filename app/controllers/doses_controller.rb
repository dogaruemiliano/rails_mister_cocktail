class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(params_dose)
    @dose.cocktail_id = params[:cocktail_id] # or the other version of code
    @ingredient = Ingredient.find(@dose.ingredient_id)
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # @dose.cocktail = @cocktail

    if @dose.save
      redirect_to(cocktail_path(@dose.cocktail_id))
    else
      render :new, notice: "Something went wrong!"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
