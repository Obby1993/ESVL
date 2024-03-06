# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#ls
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Article.destroy_all
Commande.destroy_all
Event.destroy_all
User.destroy_all
EsvlTeam.destroy_all

# tshirt = Article.new(titre: "tee-shirt Errea Sponsor ESVL", taille_disponible:"S, M, L, XL", genre: "Homme", price: 1700)
# jogging = Article.new(titre: "Jogging échauffement ESVL", taille_disponible:"S, M, L, XL", genre: "Homme", price: 2250)
# inscription_tournoi = Article.new(titre: "Inscription tournoi de l'ascension 4c4 Mixte", genre: "mixte", price: 4000)

# tshirt.save
# jogging.save
# inscription_tournoi.save

prenat_feminin = EsvlTeam.new(année: 2022, division: "R1", genre: "féminin", coach: "Mélanie", joueurs: "Julie Lopez, Laura Pasco, Catherine Martinet, Anna Montana, Brit Kendal, Luna Del Sol", autre: "Saison en cours")
prenat_feminin.save

region_masculin = EsvlTeam.new(année: 2022, division: "R2", genre: "masculin", coach: "Charlie Kaing", joueurs: "Charlie Kaing, Jérémie l'embrouille, Christopher BG, Tom Sauvignon, Dams", autre: "Saison en cours")
region_masculin.save

president = User.new(email: "president@esvl.com", password: "presidentEsvl", fonction:"président")
president.save!

# event1 = Event.new(nom: "Tournoi de l'ascension", nb_equipes: 24, date_event: Date.today + 15, deadline_register: Date.today + 10, genre: "Mixte", nb_joueur_equipe: 4, price_cents: 4000, user: president )
# event1.save!
