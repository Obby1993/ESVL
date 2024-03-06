class Entrainement < ApplicationRecord
  belongs_to :esvl_team
  belongs_to :gymnase

  validates :jour, inclusion: { in: ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche" ] }
end
