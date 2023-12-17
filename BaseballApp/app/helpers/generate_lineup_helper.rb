module GenerateLineupHelper
    def optimized_lineup(players)
      # Sort players based on different criteria
      sorted_by_avg_obp = players.sort_by { |p| [-(p.avg + p.obp), p.name] }
      sorted_by_avg = players.sort_by { |p| [-p.avg, p.name] }
      sorted_by_obp = players.sort_by { |p| [-p.obp, p.name] }
      sorted_by_slg = players.sort_by { |p| [-p.slg, p.name] }
      sorted_by_ops = players.sort_by { |p| [-p.ops, p.name] }
  
      lineup = {}
      
      # Assign players to lineup positions based on criteria
      # Batter 2: Highest combined AVG and OBP
      lineup[:number_two] = sorted_by_avg_obp.shift
      
      # Batter 3: Highest AVG
      # Ensure the player selected for Batter 2 is not considered again
      sorted_by_avg.delete(lineup[:number_two])
      lineup[:number_three] = sorted_by_avg.shift
  
      # Batter 1: Highest OBP
      # Exclude previously selected players
      sorted_by_obp.delete_if { |player| [lineup[:number_two], lineup[:number_three]].include?(player) }
      lineup[:number_one] = sorted_by_obp.shift
      
      # Batter 4: Highest SLG
      # Exclude previously selected players
      sorted_by_slg.delete_if { |player| [lineup[:number_one], lineup[:number_two], lineup[:number_three]].include?(player) }
      lineup[:number_four] = sorted_by_slg.shift
  
      # Batter 5: Highest OPS from remaining players
      sorted_by_ops.delete_if { |player| lineup.values.include?(player) }
      lineup[:number_five] = sorted_by_ops.shift
  
      # Batters 6-9: Best averages of remaining players, in decreasing order
      sorted_by_avg.delete_if { |player| lineup.values.include?(player) }
      lineup[:number_six] = sorted_by_avg.shift
      lineup[:number_seven] = sorted_by_avg.shift
      lineup[:number_eight] = sorted_by_avg.shift
      lineup[:number_nine] = sorted_by_avg.shift
  
      lineup
    end
  
    def print_lineup(lineup)
      positions = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
      lineup_str = ""
      positions.each do |position|
        next_player = lineup[:"number_#{position}"]
        lineup_str += "#{position}. #{next_player.name}\n" if next_player
      end
        lineup_str
    end
  end