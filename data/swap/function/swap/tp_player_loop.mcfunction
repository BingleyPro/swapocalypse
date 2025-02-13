# Stop if everything has been lopped through
execute if score _swap_index _game_info >= player_countTake1 _game_info run return run function swap:swap/final_tp

# Player Count - Array Index
# 1 - 0
# 2 - 1
# 3 - 2
# 4 - 3
# 5 - 4
# 6 - 5
# 7 - 6
# 8 - 7
# 9 - 8
# 10 - 9

$execute store result storage swap:swap info.s_playerInt1 int 1 run data get storage swap:swap list[$(_s_index)]
$execute store result storage swap:swap info.s_playerInt2 int 1 run data get storage swap:swap list[$(_s_index2)]

function swap:swap/tp_player with storage swap:swap info

# Keep repeating
scoreboard players remove _swap_index _game_info 1
execute store result storage swap:swap info.s_index int 1 run scoreboard players get _swap_index _game_info

execute store result score _swap_index2 _game_info run data get storage swap:swap info.s_index
scoreboard players add _swap_index2 _game_info 1
execute store result storage swap:swap info.s_index2 int 1 run data get storage swap:swap info.s_index

function swap:swap/tp_player_loop with storage swap:swap info