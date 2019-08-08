class DosesController < ApplicationController
  # def index
  #   @doses = Dose.all
  # end

  # def show
  #   @dose = Dose.all.find(params[:id])
  # end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # def edit
  #   @dose = Dose.find(params[:id])
  # end

  # def update
  #   @dose = Dose.find(params[:id])
  #   @dose.update(dose_params)
  #   redirect_to dose_path(@dose)
  # end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
