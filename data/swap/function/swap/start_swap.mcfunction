# Get the length of the array
execute store result score _swap_index _game_info run data get storage swap:swap list

# Get player count take 1
execute store result score player_countTake1 _game_info run scoreboard players get player_count _game_info

scoreboard players remove player_countTake1 _game_info 1

# Remove 1 since arrays are 0-based
scoreboard players remove _swap_index _game_info 1
execute store result storage swap:swap info.s_index int 1 run scoreboard players get _swap_index _game_info

execute store result score _swap_index2 _game_info run data get storage swap:swap info.s_index
scoreboard players add _swap_index2 _game_info 1
execute store result storage swap:swap info.s_index2 int 1 run data get storage swap:swap info.s_index

function swap:swap/tp_player with storage swap:swap info