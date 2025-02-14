# Start the swap index at 0 and save into storage
scoreboard players set _swap_index _game_info 0
execute store result storage swap:swap info.s_index int 1 run scoreboard players get _swap_index _game_info

scoreboard players set _swap_index2 _game_info 1
execute store result storage swap:swap info.s_index2 int 1 run scoreboard players get _swap_index2 _game_info

# Get player count take 1
execute store result score player_countTake1 _game_info run scoreboard players get player_count _game_info

scoreboard players remove player_countTake1 _game_info 1

function swap:swap/tp_player_loop with storage swap:swap info