execute if score _shuffle_index _game_info <= 1 _constant run return fail

execute store result storage swap:swap list[-1] int 1 run scoreboard players get _player_index _game_info

scoreboard players remove _shuffle_index _game_info 1
function swap:shuffle_list