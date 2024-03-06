class Employe < ApplicationRecord
  has_one_attached :photo

  validates :nom, :prenom, :année, :niveau_employe, presence: true
  validates :niveau_employe, inclusion: { in: ["Comité de direction", "Entraineurs", "Bénévoles"] }
end
