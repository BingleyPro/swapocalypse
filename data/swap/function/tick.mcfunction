# tick.mcfunction runs every game tick

# Set the gamemode of players/spectators
gamemode spectator @a[tag=spectator,tag=!dev]
gamemode survival @a[tag=!spectator,tag=!dev]

# Stop the function if the game is not running
execute if score game_running _game_info matches 0 run return fail

# Check if a player dies
execute as @a[scores={_deaths=1..},tag=player] run function swap:player_died

# If the swap countdown is less than 0, run the swap function
execute if score swap_countdown _game_info <= 0 _constant run function swap:swap

# If the swap countdown is above 0, decrease it by 1
execute if score swap_countdown _game_info > 0 _constant run scoreboard players remove swap_countdown _game_info 1

# Reset the countdown after swapping
execute if score swap_countdown _game_info <= 0 _constant run scoreboard players set swap_countdown _game_info 6000

# Check if there is one player left
execute if score final_player_count _game_info matches 1 run function swap:end_game