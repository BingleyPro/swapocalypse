# --- On Game Start --- #

# Gather and store the number of players
scoreboard players set player_count _game_info 0
execute as @a[tag=!spectator] run scoreboard players add player_count _game_info 1

execute store result score final_player_count _game_info run scoreboard players get player_count _game_info

execute if score final_player_count _game_info matches 1 run return run function swap:settings/show_settings

# Assign a unique number or tag to each player
scoreboard players set _player_index _game_info 1
execute if score player_count _game_info >= _player_index _game_info run function swap:setup_player

execute store result score swap_countdown _game_info run data get storage swap:settings swap_interval
scoreboard players operation swap_countdown _game_info *= 20 _constant

execute store result storage swap:settings swap_interval int 1 run scoreboard players get swap_countdown _game_info

scoreboard players set _awaiting_input _settings 0

# Update gamerules for the game start
gamerule doDaylightCycle true
gamerule doWeatherCycle true
gamerule doMobSpawning true
gamerule mobGriefing true
gamerule doMobLoot true
gamerule doTileDrops true
gamerule doEntityDrops true
gamerule doFireTick true
gamerule fallDamage true
gamerule fireDamage true
gamerule drowningDamage true
gamerule showDeathMessages true
gamerule doVinesSpread true

# FOR NOW
gamerule doImmediateRespawn true

# Put all settings into active storage
execute store result score _announce_swap _active_settings run data get storage swap:settings announce_swap
execute store result score _display_timer _active_settings run data get storage swap:settings display_timer
execute store result score _hunger _active_settings run data get storage swap:settings hunger
execute store result score _max_deaths _active_settings run data get storage swap:settings max_deaths
execute store result score _wb_size _active_settings run data get storage swap:settings wb_size
execute store result score _nether_travel _active_settings run data get storage swap:settings nether_travel
execute store result score _swap_interval _active_settings run data get storage swap:settings swap_interval
execute store result score _max_health _active_settings run data get storage swap:settings max_health

# Clear any existing effects from players
effect clear @a

clear @a

# Retrieve or compute the worldborder size
execute store result score _settings_temp _settings run data get storage swap:settings wb_size

# Generate a new worldborder size: (player_count * 1500
execute if score _settings_temp _settings matches -1 run scoreboard players operation _temp2 _settings = final_player_count _game_info
execute if score _settings_temp _settings matches -1 run scoreboard players operation _temp2 _settings *= 1500 _constant

execute if score _settings_temp _settings matches -1 run execute store result storage swap:settings_temp wb_size int 1 run scoreboard players get _temp2 _settings
execute if score _settings_temp _settings matches -1 run function swap:start/set_worldborder with storage swap:settings_temp

execute unless score _settings_temp _settings matches -1 run function swap:start/set_worldborder with storage swap:settings

execute if score _settings_temp _settings matches -1 run execute store result score _settings_temp _settings run scoreboard players get _temp2 _settings

# Take 20% off the worldborder size (can't divide or multiply by decimal)
scoreboard players operation _settings_temp _settings /= 10 _constant
scoreboard players operation _settings_temp _settings *= 8 _constant

# Divide worldborder by 2
scoreboard players operation _settings_temp _settings /= 2 _constant

execute store result storage swap:settings max_range int 1 run scoreboard players get _settings_temp _settings

# Derive min_distance for spreadplayers by dividing wb-size by player count
scoreboard players operation min_distance _settings = _settings_temp _settings

execute store result score _final_player_count_1 _game_info run scoreboard players get final_player_count _game_info
scoreboard players operation _final_player_count_1 _game_info += 1 _constant

scoreboard players operation min_distance _settings /= final_player_count_1 _game_info

execute store result storage swap:settings spread_distance int 1 run scoreboard players get min_distance _settings

# Tag a random player as center
tag @a remove center
tag @r add center

execute as @a[tag=center] run worldborder center ~ ~

# Spread the players
function swap:start/spread_players with storage swap:settings

function swap:start/set_max_health with storage swap:settings

# Set the players' spawnpoints
execute as @a at @s run spawnpoint @s ~ ~ ~

tag @a remove center

# Start the game timer
scoreboard players set _game_timer_t _game_info 0
scoreboard players set _game_timer_s _game_info 0
scoreboard players set _game_timer_m _game_info 0
scoreboard players set _game_timer_h _game_info 0

# Mark the game as running
scoreboard players set game_running _game_info 1