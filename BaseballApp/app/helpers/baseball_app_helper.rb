module BaseballAppHelper
    # IIterates through remaining players and finds highest OBP
    # Also checks if player has already been added to lineup
    def highest_obp?(player, lineup)
        PlayerModel.where("obp > ?", player.obp).where.not(id: lineup.map(&:player_model_id)).count == 0
    end
    
    # Iterates through remaining players and finds highest OBP + AVG
    # Also checks if player has already been added to lineup
    def highest_average_and_obp?(player, lineup)
        combined_score = player.obp + player.avg
        PlayerModel.where("obp + avg > ?", combined_score).where.not(id: lineup.map(&:player_model_id)).count == 0
    end
    
    # Iterates through remaining players and finds highest AVG
    # Also checks if player has already been added to lineup
    def highest_avg?(player, lineup)
        PlayerModel.where("avg > ?", player.avg).where.not(id: lineup.map(&:player_model_id)).count == 0
    end
    
    # Iterates through remaining players and finds highest SLG
    # Also checks if player has already been added to lineup
    def highest_slg?(player, lineup)
        PlayerModel.where("slg > ?", player.slg).where.not(id: lineup.map(&:player_model_id)).count == 0
    end
    
    # Uses calculated values to put together optimized lineup
    def optimized_lineup(players)
        lineup = {}

        # Get lineup 1-4 first in order 1, 3, 2, 4
        lineup[:number_one] = players.find { |player| highest_obp?(player, lineup) },
        lineup[:number_three] = players.find { |player| highest_avg?(player, lineup) },
        lineup[:number_two] = players.find { |player| highest_average_and_obp?(player, lineup) },
        lineup[:number_four] = players.find { |player| highest_slg?(player, lineup) },
    
        # Create a new list that contains the unused players
        remaining_players = players.reject { |player| lineup.values.include?(player) }
        
        # Order players in descending order based on OBP
        remaining_players.order(obp: :desc)

        # Fill in rest of lineup 
        lineup[:number_five] = remaining_players.first
        lineup[:number_six] = remaining_players.second
        lineup[:number_seven] = remaining_players.third
        lineup[:number_eight] = remaining_players.fourth
        lineup[:number_nine] = remaining_players.fifth
    
        lineup
    end

    def print_lineup(lineup)
        positions = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
        positions.each do |position|
            next_player = lineup[:"number_#{position}"]
            puts "#{position}. #{next_player.name}"
          end
        end
end
