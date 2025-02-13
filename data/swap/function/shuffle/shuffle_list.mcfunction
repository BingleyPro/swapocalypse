# Stop if everything has been lopped through
execute if score _shuffle_index _game_info < 1 _constant run return run function swap:swap/start_swap

# Roll a random number between 0 (since arrays are 0-based) and the current index
$execute store result score _shuffle_roll _game_info run random roll 0..$(index)

# Unless the random number is the same as the current index, then skip
execute if score _shuffle_roll _game_info = _shuffle_index _game_info run return run function swap:shuffle/repeat_shuffle_list

execute store result storage swap:swap info.roll int 1 run scoreboard players get _shuffle_roll _game_info

function swap:shuffle/insert_shuffle_index with storage swap:swap info

scoreboard players remove _shuffle_index _game_info 1
execute store result storage swap:swap info.index int 1 run scoreboard players get _shuffle_index _game_info

function swap:shuffle/shuffle_list with storage swap:swap info