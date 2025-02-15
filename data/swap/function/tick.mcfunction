execute if score game_running _game_info matches 0 run return fail

gamemode spectator @a[tag=spectator]

gamemode survival @a[tag=player]

# Check if a player dies
execute as @a[scores={_deaths=1..},tag=player] run function swap:player_died

execute if score swap_countdown _game_info <= 0 _constant run function swap:swap

execute if score swap_countdown _game_info > 0 _constant run scoreboard players remove swap_countdown _game_info 1

execute if score swap_countdown _game_info <= 0 _constant run scoreboard players set swap_countdown _game_info 6000

# Check if there is one player left
execute if score final_player_count _game_info matches 1 run function swap:end_game