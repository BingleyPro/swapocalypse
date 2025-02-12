# Tag the next player to loop
tag @r[tag=!player] add setup_player

# Assign them the next unique number
execute store result score @e[limit=1, tag=setup_player] _player_number run scoreboard players get _player_index _game_info

# Give them the player tag and remove setup tag
tag @a[limit=1,tag=setup_player] add player
tag @a[tag=setup_player] remove setup_player

# Keep repeating the loop for each player
scoreboard players add _player_index _game_info 1
execute if score player_count _game_info >= _player_index _game_info run function swap:setup_player