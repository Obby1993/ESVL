class EmployesController < ApplicationController

  def new
    @employe = Employe.new
  end

  def create
    @employe = Employe.new(employe_params)
    if @employe.save!
      redirect_to root_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def employe_params
    params.require(:employe).permit(:nom, :prenom, :poste, :photo, :année, :niveau_employe)
  end
end
