execute if score _player_index _game_info > player_count _game_info run return run function swap:shuffle/start_shuffle_list

execute store result storage swap:swap info.player_index_temp int 1 run scoreboard players get _player_index _game_info

data modify storage swap:swap list append from storage swap:swap info.player_index_temp

scoreboard players add _player_index _game_info 1
function swap:shuffle/build_list