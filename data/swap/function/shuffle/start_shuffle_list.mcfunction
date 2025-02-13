execute store result score _shuffle_index _game_info run scoreboard players get player_count _game_info

# Remove 1 since arrays are 0-based
scoreboard players remove _shuffle_index _game_info 1

execute store result storage swap:swap info.index int 1 run scoreboard players get _shuffle_index _game_info

function swap:shuffle/shuffle_list with storage swap:swap info