class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      redirect_to events_path()
      @article = Article.create(event_id: @event.id, titre: @event.nom, price_cents: @event.price_cents, remarque: "#{@event.nb_joueur_equipe} c #{@event.nb_joueur_equipe} #{@event.genre}")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    @event.destroy
    redirect_to events_path(), status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:nom, :nb_equipes, :genre, :nb_joueur_equipe, :date_event, :deadline_register, :price_cents)
  end
end
