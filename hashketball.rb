def game_hash
  {
    home:
    {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals:3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks:7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1, 
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
        ]
    },
    away:
    {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
        ]
    }
  }
end

def num_points_scored(name)
  game_hash.each do |x, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          return player[:points] if player[:player_name] == name
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |x, team|
    team.each do |k, v|
      if k == :players
        v.each do |player|
          return player[:shoe] if player[:player_name] == name
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |x, team|
    return game_hash[x][:colors] if team[:team_name] == team_name
  end
end

def team_names
  game_hash.collect do |x, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  numbers = []
  
  game_hash.each do |x, team|
    if team[:team_name] == team_name
      team.each do |k, v|
        if k == :players
          v.each do |num|
            numbers << num[:number]
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  stats_hash = {}
  
  game_hash.each do |x, team|
    game_hash.each do |x, team|
      team.each do |k, v|
        if k == :players
          game_hash[x][k].each do |player|
            next unless player[:player_name] == name
            stats_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds
  big_shoe = 0 
  rebounds = 0 
  
  game_hash.each do |team, details|
    details[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  name = nil
  num_points = 0
  
  game_hash.each do |team, details|
    details[:players].each do |player|
      if player[:points] > num_points
        num_points = player[:points]
        name = player[:player_name]
      end
    end
  end
  name
end

def winning_team
  home = 0 
  away = 0 
  
  game_hash[:home][:players].each do |key, value|
    home += value[:points]
  end
  
  game_hash[:away][:players].each do |key, value|
    away += value[:points]
  end
  
  if home > away
    return game_hash[:home][:team_name]
  elsif home < away
    return game_hash[:away][:team_name]
  else 
    return "It's a tie!"
  end
end