class DosesController < ApplicationController

    def index
      @doses = dose.all
    end

    def show
    end

    def new
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.new
    end

    def create
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.new(dose_params)
      @dose.cocktail = @cocktail
      if @dose.save!
        redirect_to cocktail_path(@cocktail)
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @dose.update(dose_params)
        redirect_to cocktail_path(@dose)
      else
        render :edit
      end
    end

    def destroy
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.find(params[:id])
      @dose.destroy
      redirect_to cocktail_path(@cocktail)
    end

    private

    def set_dose
      @dose = Dose.find(params[:id])
    end

    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end
