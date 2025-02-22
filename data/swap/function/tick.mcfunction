# tick.mcfunction runs every game tick

# Check for new players
execute as @a unless score @s joined matches 1 run function swap:tick/handle_new_player

# Set the gamemode of players/spectators
gamemode spectator @a[tag=spectator,tag=!dev]
gamemode survival @a[tag=!spectator,tag=!dev]

# Check for input with settings
execute if score _awaiting_input _settings matches 1 if score @a[tag=op,limit=1,scores={input=1..}] input matches 1.. run function swap:settings/direct-set-check with storage swap:settings
execute if score _awaiting_input _settings matches 1 if score @a[tag=op,limit=1,scores={input=..-1}] input matches ..-1 run function swap:settings/direct-set-check with storage swap:settings

# Stop the function if the game is not running
execute if score game_running _game_info matches 0 run return fail

execute if score _hunger _active_settings matches 0 run effect give @a[tag=player] saturation infinite 1 true

# Check if a player dies
function swap:tick/check_player_final_death with storage swap:settings

# 100 ticks = 5 seconds
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 100 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"5"},{"color":"gold","text":" seconds!"}]
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 80 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"4"},{"color":"gold","text":" seconds!"}]
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 60 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"3"},{"color":"gold","text":" seconds!"}]
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 40 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"2"},{"color":"gold","text":" seconds!"}]
execute if score _announce_swap _active_settings matches 2 if score swap_countdown _game_info matches 20 run tellraw @a [{"color":"gold","text":"Swapping in "},{"color":"red","text":"1"},{"color":"gold","text":" seconds!"}]

# If the swap countdown is above 0, decrease it by 1
execute if score swap_countdown _game_info matches 1.. run scoreboard players remove swap_countdown _game_info 1

# If the swap countdown is less than 0, run the swap function
execute if score swap_countdown _game_info matches ..0 run function swap:swap

# Reset the countdown after swapping
execute if score swap_countdown _game_info matches ..0 run function swap:tick/reset_swap_interval with storage swap:settings

# Check if there is one player left
execute if score final_player_count _game_info matches 1 run function swap:end_game

# Increase game timer
scoreboard players add _game_timer_t _game_info 1

execute if score _game_timer_t _game_info matches 20.. run scoreboard players add _game_timer_s _game_info 1
execute if score _game_timer_t _game_info matches 20.. run scoreboard players set _game_timer_t _game_info 0

execute if score _game_timer_s _game_info matches 60.. run scoreboard players add _game_timer_m _game_info 1
execute if score _game_timer_s _game_info matches 60.. run scoreboard players set _game_timer_s _game_info 0

execute if score _game_timer_m _game_info matches 60.. run scoreboard players add _game_timer_h _game_info 1
execute if score _game_timer_m _game_info matches 60.. run scoreboard players set _game_timer_m _game_info 0

execute if score _display_timer _active_settings matches 2 if score _game_timer_s _game_info matches ..9 if score _game_timer_h _game_info matches 0 run title @a actionbar [{"color":"gold","score":{"name":"_game_timer_m","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","text":"0"},{"color":"gold","score":{"name":"_game_timer_s","objective":"_game_info"}}]
execute if score _display_timer _active_settings matches 2 if score _game_timer_s _game_info matches 10.. if score _game_timer_h _game_info matches 0 run title @a actionbar [{"color":"gold","score":{"name":"_game_timer_m","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","score":{"name":"_game_timer_s","objective":"_game_info"}}]

execute if score _display_timer _active_settings matches 2 if score _game_timer_s _game_info matches ..9 if score _game_timer_h _game_info matches 1.. if score _game_timer_m _game_info matches ..9 run title @a actionbar [{"color":"gold","score":{"name":"_game_timer_h","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","text":"0"},{"color":"gold","score":{"name":"_game_timer_m","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","text":"0"},{"color":"gold","score":{"name":"_game_timer_s","objective":"_game_info"}}]
execute if score _display_timer _active_settings matches 2 if score _game_timer_s _game_info matches 10.. if score _game_timer_h _game_info matches 1.. if score _game_timer_m _game_info matches ..9 run title @a actionbar [{"color":"gold","score":{"name":"_game_timer_h","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","text":"0"},{"color":"gold","score":{"name":"_game_timer_m","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","score":{"name":"_game_timer_s","objective":"_game_info"}}]

execute if score _display_timer _active_settings matches 2 if score _game_timer_s _game_info matches ..9 if score _game_timer_h _game_info matches 1.. if score _game_timer_m _game_info matches 10.. run title @a actionbar [{"color":"gold","score":{"name":"_game_timer_h","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","score":{"name":"_game_timer_m","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","text":"0"},{"color":"gold","score":{"name":"_game_timer_s","objective":"_game_info"}}]
execute if score _display_timer _active_settings matches 2 if score _game_timer_s _game_info matches 10.. if score _game_timer_h _game_info matches 1.. if score _game_timer_m _game_info matches 10.. run title @a actionbar [{"color":"gold","score":{"name":"_game_timer_h","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","score":{"name":"_game_timer_m","objective":"_game_info"}},{"color":"red","text":":"},{"color":"gold","score":{"name":"_game_timer_s","objective":"_game_info"}}]

# Disable nether portals
execute if score _nether_travel _active_settings matches 0 run execute as @a at @s run fill ~-.3 ~-.3 ~-.3 ~.3 ~1.8 ~.3 air replace nether_portal