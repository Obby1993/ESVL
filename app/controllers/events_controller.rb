class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @events = Event.all.sort do |event1, event2|
      event1.date_event <=> event2.date_event
    end
  end

  def show
    @event = Event.find(params[:id])
      # events
      @ordres = Event.all
      # selectionnne seulement les events pas encore passé
      @ordres.select { |e| (e.date_event - DateTime.now).positive? }
      # ordonne les events du plus récent
      @ordres = @ordres.sort do |event1, event2|
        event1.date_event <=> event2.date_event
      end
      # selectionne les 4 premeiers
      @ordres = @ordres.select { @ordres[0..3] }
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save!
      redirect_to events_path()
      @article = Article.create(event_id: @event.id, titre: @event.nom, price: @event.price_cents, remarque: "#{@event.nb_joueur_equipe} c #{@event.nb_joueur_equipe} #{@event.genre}")
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
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path(), status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:nom, :nb_equipes, :genre, :nb_joueur_equipe, :date_event, :deadline_register, :price_cents, :photo, :autre)
  end

  def ordre_events
    @events.sort do |event1, event2|
      event1.date_event <=> event2.date_event
    end
  end
end
