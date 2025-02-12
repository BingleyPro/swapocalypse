execute if score game_running _game_info matches 0 run return fail

execute if score swap_countdown _game_info <= 0 _constant run function swap:swap

execute if score swap_countdown _game_info > 0 _constant run scoreboard players remove swap_countdown _game_info 1

execute if score swap_countdown _game_info <= 0 _constant run scoreboard players set swap_countdown _game_info 6000