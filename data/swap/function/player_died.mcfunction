tag @a[scores={_deaths=1..},tag=player] add spectator
tag @a[scores={_deaths=1..},tag=player] remove player

scoreboard players set @a[scores={_deaths=1..},tag=spectator] _deaths 0

# Get the number of the players
scoreboard players set player_count _game_info 0
execute as @a[tag=!spectator] run scoreboard players add player_count _game_info 1

# Assign a number to each player
scoreboard players set _player_index _game_info 1
execute if score player_count _game_info >= _player_index _game_info run function swap:setup_player

execute store result score final_player_count _game_info run scoreboard players get player_count _game_info