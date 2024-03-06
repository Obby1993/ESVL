class EsvlTeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @esvl_team = EsvlTeam.find(params[:id])
  end

  def new
    @esvl = EsvlTeam.new
  end

  def create
    @esvl = EsvlTeam.new(esvl_params)
    if @esvl.save!
      redirect_to vie_sportive_path()
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def esvl_params
    params.require(:esvl_team).permit(:année, :categorie, :division, :coach, :résultat, :autres, :photo, :genre)
  end
end
