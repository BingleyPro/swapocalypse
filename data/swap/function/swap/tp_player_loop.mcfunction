# Stop if everything has been lopped through
execute if score _swap_index _game_info >= player_countTake1 _game_info run return run function swap:swap/final_tp with storage swap:swap info

$execute store result storage swap:swap info.s_playerInt1 int 1 run data get storage swap:swap list[$(s_index)]
$execute store result storage swap:swap info.s_playerInt2 int 1 run data get storage swap:swap list[$(s_index2)]

function swap:swap/tp_player with storage swap:swap info

# Keep repeating
scoreboard players add _swap_index _game_info 1
execute store result storage swap:swap info.s_index int 1 run scoreboard players get _swap_index _game_info

scoreboard players add _swap_index2 _game_info 1
execute store result storage swap:swap info.s_index2 int 1 run scoreboard players get _swap_index2 _game_info

function swap:swap/tp_player_loop with storage swap:swap info