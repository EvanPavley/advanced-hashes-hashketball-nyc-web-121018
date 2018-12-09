require "pry"

def game_hash
    #returns a hash
    #returns the correct top-level keys
    #returns the correct team-level keys
    game_hash = {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => {
                "Alan Anderson" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1
                },
                "Reggie Evans" => {
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7,
                },
                "Brook Lopez" => {
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15
                },
                "Mason Plumlee" => {
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5
                },
                "Jason Terry" => {
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1
                }
            }
        },
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => {
                "Jeff Adrien" => {
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2
                },
                "Bismak Biyombo" => {
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10
                },
                "DeSagna Diop" => {
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5
                },
                "Ben Gordon" => {
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0
                },
                "Brendan Haywood" => {
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 22,
                    :blocks => 5,
                    :slam_dunks => 12
                }
            }
        }
    }
end

def good_practices
    game_hash.each do |location, team_data|
        #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
        binding.pry
        team_data.each do |attribute, data|
            #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
            binding.pry
            
            #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
            
            #YES IT WILL
            #because data is a string-- "Brooklyn Nets" the value of home
            data.each do |data_item|
                binding.pry
            end
        end
    end
end

def num_points_scored(player_name)
    #looks through the whole hash's team data at this sope to get away or home
    game_hash.each do |location, team_data|
        #binding.pry
        #if in the team data, at the players key, the value of player_name is not empty AKA if it exists
        if team_data[:players][player_name]
            #binding.pry
            #returns the value of points at player_name
            return team_data[:players][player_name][:points]
        end
    end
end
#test:
#puts "#{num_points_scored("Alan Anderson")}"

def shoe_size(player_name)
    #baised off of num_points_scored
    game_hash.each do |location, team_data|
        if team_data[:players][player_name]
            return team_data[:players][player_name][:shoe]
        end
    end
end
#test:
#puts "#{shoe_size("Alan Anderson")}"

def team_colors(team_name)
    game_hash.each do |location, team_data|
        if team_data[:team_name] == team_name
            return team_data[:colors]
        end
    end
end
#test:
#puts "#{team_colors("Charlotte Hornets")}"

def team_names
    team_names_arr = []
    game_hash.each do |location, team_data|
        team_names_arr << team_data[:team_name]
    end
    return team_names_arr
end
#test:
#puts "#{team_names}"

def player_numbers(team_name)
    jersey_numbers_arr = []
    game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
            if team_data[:team_name] == team_name
                jersey_numbers_arr << team_data[:players][name][:number]
            end
        end
    end
    return jersey_numbers_arr
end
#test:
#puts "#{player_numbers("Charlotte Hornets")}"

def player_stats(player_name)
    game_hash.each do |location, team_data|
        if team_data[:players][player_name]
            return team_data[:players][player_name]
        end
    end
end
#test:
#puts "#{player_stats("Alan Anderson")}"

def big_shoe_rebounds
    big_foot = ""
    biggest_shoe_size = 0
    num_rebounds = 0
    game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
            if biggest_shoe_size < shoe_size(name)
                biggest_shoe_size = shoe_size(name)
                big_foot = name
            end
        end
    end
    return player_stats(big_foot)[:rebounds]
end
#test:
#puts "#{big_shoe_rebounds}"
