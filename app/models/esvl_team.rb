class EsvlTeam < ApplicationRecord
  has_many_attached :photos
  validates :année, :division, :genre, :coach, :joueurs, presence: true
  validates :genre, inclusion: { in: ["Homme", "Femme", "Mixte"] }
end
