class NextGamesController < ApplicationController
  require 'csv'

  def import
    file = params[:csv_file]
    esvl_team_id = params[:esvl_team_id]
    NextGame.import_csv(file, esvl_team_id)
    redirect_to next_games_path, notice: 'Importation terminée.'
  end

  def index
    @next_games = NextGame.all
    @esvl_teams = EsvlTeam.where(année: DateTime.now.year)

  end

  def new
    @next_game = NextGame.new
    @esvl_teams = EsvlTeam.where(année: DateTime.now.year)
  end

end
