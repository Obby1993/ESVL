class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]



  def home
    @events = Event.all
    @ordres = @events.sort do |event1, event2|
      event1.date_event <=> event2.date_event
    end
    @ordres.each do |event|
      valeur = event.date_event - DateTime.now
      if valeur.negative?
        @ordres.delete(event)
      end
    end
  end

end
