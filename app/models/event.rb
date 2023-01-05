class Event < ApplicationRecord
  has_many :event_teams, dependent: :destroy
  belongs_to :user
  has_one :article
  # has_one :article, optional: true
  validates :nom, :nb_equipes, :date_event, :genre, :nb_joueur_equipe, presence: true
  validates :genre, inclusion: { in: ["Homme", "Femme", "Mixte"] }
  validates :nb_equipes, :nb_joueur_equipe, numericality: { greater_than: 0 }
  # validates :date_event_cannot_be_in_the_past
  validates :deadline_register, comparison: { less_than_or_equal_to: :date_event }

  monetize :price_cents

  private

  def date_event_cannot_be_in_the_past
    errors.add(:date_event, "Ne peut être dans le passé") if date_event < Date.today
  end
end
