class Partenaire < ApplicationRecord
  has_one_attached :photo
  validates :année, :entreprise, :contact, presence: true

end
