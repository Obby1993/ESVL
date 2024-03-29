class EventTeamsController < ApplicationController
  def show
    @team = EventTeam.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @team = EventTeam.new
  end

  def create
    @event = Event.find(params[:event_id])
    @team = EventTeam.new(event_team_params)
    @team.event = @event
    @article = Article.find_by(event_id: @event.id)
    session[:panier] << @article.id

    if @team.save!
      redirect_to articles_path()

    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @team = EventTeam.find(params[:id])
  end

  def update
    @team = EventTeam.find(params[:id])
    @team.update(event_team_params)
    redirect_to events_path()
  end

  def destroy
    @team.destroy
    redirect_to events_path(), status: :see_other
  end

  def event_team_params
    params.require(:event_team).permit(:nom_equipe, :niveau, :nom_capitaine, :email_capitaine, :numero_capitaine, :nb_joueur, :joueurs)
  end

end
