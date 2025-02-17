# tick.mcfunction runs every game tick

# Set the gamemode of players/spectators
gamemode spectator @a[tag=spectator,tag=!dev]
gamemode survival @a[tag=!spectator,tag=!dev]

# Stop the function if the game is not running
execute if score game_running _game_info matches 0 run return fail

execute if score _hunger _active_settings matches 2 run effect give @a[tag=player] saturation infinite 1 true

# Check if a player dies
function swap:tick/check_player_final_death with storage swap:settings

# 100 ticks = 5 seconds
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 100 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"5"},{"color":"gold","text":" seconds!"}]
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 80 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"4"},{"color":"gold","text":" seconds!"}]
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 60 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"3"},{"color":"gold","text":" seconds!"}]
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 40 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"2"},{"color":"gold","text":" seconds!"}]
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 20 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"1"},{"color":"gold","text":" seconds!"}]

# If the swap countdown is above 0, decrease it by 1
execute if score swap_countdown _game_info > 0 _constant run scoreboard players remove swap_countdown _game_info 1

# If the swap countdown is less than 0, run the swap function
execute if score swap_countdown _game_info <= 0 _constant run function swap:swap

# Reset the countdown after swapping
execute if score swap_countdown _game_info <= 0 _constant run function swap:tick/reset_swap_interval with storage swap:settings

# Check if there is one player left
execute if score final_player_count _game_info matches 1 run function swap:end_game