class Gymnase < ApplicationRecord
  has_many :entrainements, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
