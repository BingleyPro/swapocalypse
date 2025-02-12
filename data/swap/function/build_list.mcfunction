execute if score _player_index _game_info >= player_count _game_info run return run function swap:start_shuffle_list

execute store result storage swap:swap list[-1] int 1 run scoreboard players get _player_index _game_info

scoreboard players add _player_index _game_info 1
function swap:build_list