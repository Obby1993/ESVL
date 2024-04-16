class NextGame < ApplicationRecord
  require 'date'
  belongs_to :esvl_team

  attribute :day, :date
  attribute :heure, :time
  attribute :lieu, :string
  attribute :team_a, :string
  attribute :team_b, :string
  attribute :division, :string

  alias_attribute :date, :day

#   def self.import_csv(file, esvl_team_id)
#     CSV.foreach(file.path, encoding: 'bom|utf-8', col_sep: ';', invalid: :replace, headers: true) do |row|
#       if row[6] == "ETOILE SPORTIVE DE VILLENEUVE" || row[8] == "ETOILE SPORTIVE DE VILLENEUVE"
#         next_game = NextGame.new
#         next_game.day = row[3]
#         next_game.heure = row[4]
#         next_game.lieu = row[12]
#         next_game.team_a = row[6]
#         next_game.team_b = row[8]
#         next_game.esvl_team_id = esvl_team_id
#         next_game.save
#       end
#     end
#   end
# end

  def self.import_csv(file, esvl_team_id)
    CSV.foreach(file.path, encoding: 'bom|utf-8', col_sep: ';', headers: true) do |row|
      # Convertir chaque valeur de la ligne en UTF-8 en remplaçant les caractères invalides
      encoded_row = row.map { |value| value.encode('UTF-8', invalid: :replace, undef: :replace, replace: '') }

      if encoded_row[6] == "ETOILE SPORTIVE DE VILLENEUVE" || encoded_row[8] == "ETOILE SPORTIVE DE VILLENEUVE"
        next_game = NextGame.new
        next_game.day = encoded_row[3]
        next_game.heure = encoded_row[4]
        next_game.lieu = encoded_row[12]
        next_game.team_a = encoded_row[6]
        next_game.team_b = encoded_row[8]
        next_game.esvl_team_id = esvl_team_id
        next_game.save
      end
    end
  end
end
