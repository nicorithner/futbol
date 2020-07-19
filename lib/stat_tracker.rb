require "CSV"
require "./lib/games"
class StatTracker
  attr_reader :games

  def self.from_csv(locations)
    StatTracker.new(locations)
  end

  def initialize(locations)
    @games ||= turn_games_csv_data_into_games_objects(locations[:games])
    @game_teams ||= turn_games_csv_data_into_games_objects(locations[:game_teams])
    # @teams = locations[:teams]
    # @game_teams = locations[:game_teams]
  end

  def turn_games_csv_data_into_games_objects(games_csv_data)
    games_objects_collection = []
    CSV.foreach(games_csv_data, headers: true, header_converters: :symbol) do |row|
      games_objects_collection << Games.new(row)
    end
    games_objects_collection
    # require "pry"; binding.pry
  end

  def turn_games_csv_data_into_game_teams_objects(game_teams_csv_data)
    game_teams_objects_collection = []
    CSV.foreach(game_teams_csv_data, headers: true, header_converters: :symbol) do |row|
      game_teams_objects_collection << GameTeams.new(row)
    end
    game_teams_objects_collection
    # require "pry"; binding.pry
  end

  def highest_total_score
    output = @games.max_by do |game|
      game.total_game_score
    end
    output.total_game_score
  end

  def lowest_total_score
    output = @games.min_by do |game|
      game.total_game_score
    end
    output.total_game_score
  end

  def percentage_home_wins
    # binding.pry
    @game_teams
  end

end
