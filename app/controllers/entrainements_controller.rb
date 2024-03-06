class EntrainementsController < ApplicationController
  def new
    @esvl_teams = EsvlTeam.where(année: DateTime.now.year)
    @gymnases = Gymnase.all
    @entrainement = Entrainement.new
  end

  def create
    # esvl_team_id = params[:esvl_team_id]
    @entrainement = Entrainement.new(params_entrainement)
    if @entrainement.save!
      redirect_to saison_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @entrainement = Entrainement.find(params[id])
    @entrainement.destroy
  end

  private

  def params_entrainement
    params.require(:entrainement).permit(:horaire_debut, :horaire_fin, :gymnase_id, :esvl_team_id, :jour)
  end
end
