class Document < ApplicationRecord
  validates :titre, :année, presence: true

  has_one_attached :document

end
