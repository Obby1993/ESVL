class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  require "csv"
  include CloudinaryHelper



  def home
    # employes de l'année
    year = DateTime.now.year
    # employés par niveau "Comité de direction"
    @employes_direction = Employe.where(année: year, niveau_employe: "Comité de direction")
    # employés par niveau "entraineurs"
    @employes_entraineur = Employe.where(année: year, niveau_employe: "Entraineurs")
    # employés par niveau "Bénévoles"
    @employes_benevole = Employe.where(année: year, niveau_employe: "Bénévoles")

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


    # partenaires
    @partenaires = Partenaire.all
    @partenaires_year = @partenaires.select { |partenaire| (partenaire.année.year == DateTime.now.year) }
    # @partenaires_year_past = @partenaires.select { |partenaire| (partenaire.année.year == DateTime.now.year-1) }
  end


  def club
    # employes de l'année
    year = DateTime.now.year
    # employés par niveau "Comité de direction"
    @employes_direction = Employe.where(année: year, niveau_employe: "Comité de direction")
    # employés par niveau "entraineurs"
    @employes_entraineur = Employe.where(année: year, niveau_employe: "Entraineurs")
    # employés par niveau "Bénévoles"
    @employes_benevole = Employe.where(année: year, niveau_employe: "Bénévoles")

    # events
    @events = Event.all
    # ordonne les events du plus récent
    @ordres = @events.sort do |event1, event2|
      event1.date_event <=> event2.date_event
    end
    # ne pas afficher les events passés
    @ordres.each do |event|
      valeur = event.date_event - DateTime.now
      if valeur.negative?
        @ordres.delete(event)
      end
    end
  end

  def articles
    @articles = Article.select { |a| a.display == true }
  end



  def filtre_equipe
    @esvl_teams = EsvlTeam.where(année: DateTime.now.year)
    if params[:query].present?
      sql_subquery = "
      esvl_teams.division ILIKE :query
      OR esvl_teams.genre ILIKE :query
      OR esvl_teams.categorie ILIKE :query
      OR esvl_teams.coach ILIKE :query"

      @esvl_teams = @esvl_teams.where(sql_subquery, query: "%#{params[:query]}%")
      # @esvl_teams = @esvl_teams.select { |team| (team.année.year == DateTime.now.year) }
    end
  end

  def vie_sportive
    @esvl_teams = EsvlTeam.where(année: DateTime.now.year)
    @next_games = NextGame.all

    @mois_en_lettres = {
      1 => "janvier",
      2 => "février",
      3 => "mars",
      4 => "avril",
      5 => "mai",
      6 => "juin",
      7 => "juillet",
      8 => "août",
      9 => "septembre",
      10 => "octobre",
      11 => "novembre",
      12 => "décembre"
    }
  end

  def saison
    @entrainements = Entrainement.all
    @heure = (8..23).to_a
    @semaine = %w[Lundi Mardi Mercredi Jeudi Vendredi Samedi Dimanche]
    @documents = Document.where(année: DateTime.now.year)

    @gymnases = Gymnase.all
    @markers = @gymnases.geocoded.map do |gymnase|
      {
        lat: gymnase.latitude,
        lng: gymnase.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: {gymnase: gymnase})
      }
    end
  end


  def contact
    # partenaires
    @partenaires = Partenaire.all
    @partenaires_year = @partenaires.select { |partenaire| (partenaire.année.year == DateTime.now.year) }
  end
  # email

  def envoyer_email
    nom = params[:nom]
    email = params[:email]
    message = params[:message]

    ContactMailer.email(nom, email, message).deliver_now

    redirect_to root_path, notice: "Merci ! Votre e-mail a été envoyé avec succès."
  end



end
