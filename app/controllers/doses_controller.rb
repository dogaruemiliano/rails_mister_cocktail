class DosesController < ApplicationController

  def new
    @dose = Dose.new
    # raise
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(params_dose)
    raise
    # @ingredient = @dose.ingredient
    @ingredient = Ingredients.new(@dose.ingredient_id)

    if @dose.save
      redirect_to(cocktail_path(@dose.ingredient_id))
      # redirect_to(cocktail_path(@ingredient))
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
