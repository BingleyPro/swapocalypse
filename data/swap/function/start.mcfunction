# --- On Game Start --- #

# Get the number of the players
scoreboard players set player_count _game_info 0
execute as @a[tag=player] run scoreboard players add player_count _game_info 1

# Assign a number to each player
scoreboard players set _player_index _game_info 1
execute if score player_count _game_info >= _player_index _game_info run function swap:setup_player

# Setup Game
worldborder set 2000 3