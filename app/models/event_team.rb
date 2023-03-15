class EventTeam < ApplicationRecord
  belongs_to :event
  validates :nom_equipe, :niveau, :nom_capitaine, :email_capitaine, :numero_capitaine, :nb_joueur, :joueurs, presence: true
  validates :email_capitaine, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
    message: "l'email n'est pas valide" }
  validates :numero_capitaine, format: { with: /\(?\d{3}\)?(\s|-)?\d{3}(\s|-)?\d{4}/,
    message: "le numéro n'est pas valide" }
end
