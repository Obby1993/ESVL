class GymnasesController < ApplicationController
  def new
    @gymnase = Gymnase.new
  end

  def create
    @gymnase = Gymnase.new(params_gymnase)
    if @gymnase.save!
      redirect_to saison_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @gymnase = Gymnase.find(params[id])
    @gymnase.destroy
  end

  private

  def params_gymnase
    params.require(:gymnase).permit(:address, :nom)
  end
end
