class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @doses = Dose.where("name LIKE '%#{params[:query]}%'")
    else
      @doses = Dose.all
    end
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
      redirect_to @dose
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to dose_path
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
