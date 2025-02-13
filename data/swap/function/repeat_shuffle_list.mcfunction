scoreboard players remove _shuffle_index _game_info 1
execute store result storage swap:swap info.index int 1 run scoreboard players get _shuffle_index _game_info

function swap:shuffle_list with storage swap:swap info