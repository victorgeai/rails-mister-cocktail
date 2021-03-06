class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def show
    @dose = Dose.new
  end

  def edit
    @dose = Dose.new
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to @cocktail
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
