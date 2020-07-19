## Arique's set up
class Games
  attr_reader :game_id,
              :season,
              :type,
              :date_time,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals,
              :venue,
              :venue_link

  def initialize(params)
    @game_id = params[:game_id]
    @season = params[:season]
    @type = params[:type]
    @date_time = params[:date_time]
    @away_team_id = params[:away_team_id]
    @home_team_id = params[:home_team_id]
    @away_goals = params[:away_goals].to_i
    @home_goals = params[:home_goals].to_i
    @venue = params[:venue]
    @venue_link = params[:venue_link]
  end

  def total_game_score
    @away_goals + @home_goals
  end
end

# class Game
#   # def initialize(data)
#   #   @away_goals = data["away_goals"].to_i
#   #   @home_goals = data["home_goals"].to_i

#   # end

#   def total_game_score
#     @away_goals + @home_goals
#   end
# end