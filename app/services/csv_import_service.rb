class CsvImportService
  require 'csv'

  def call(file)
    opened_file = File.open(file)
    options = { headers: true, col_sep: ';' }
    CSV.foreach(opened_file, **options) do |row|

      # map the CSV columns to your database columns
      next_game_hash = {}
      next_game_hash[:date] = row['Date']
      next_game_hash[:heure] = row['Heure']
      next_game_hash[:team_a] = row['EQA_nom']
      next_game_hash[:team_b] = row['EQB_nom']
      next_game_hash[:lieu] = row['Salle']

      NextGame.find_or_create_by!(next_game_hash)
      # for performance, you could create a separate job to import each user
      # CsvImportJob.perform_later(user_hash)
    end
  end
end
