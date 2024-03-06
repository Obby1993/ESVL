class EsvlTeam < ApplicationRecord
  has_one_attached :photo
  has_many :next_games, dependent: :destroy
  has_many :entrainements, dependent: :destroy
  validates :année, :division, :genre, :coach, :categorie, presence: true
  validates :genre, inclusion: { in: ["Homme", "Femme", "Mixte"] }
  validates :categorie, inclusion: { in: ["Senior", "Jeune"] }
end
