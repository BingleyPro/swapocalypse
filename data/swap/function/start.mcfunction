# --- On Game Start --- #

# Get the number of the players
scoreboard players set player_count _game_info 0
execute as @a[tag=!spectator] run scoreboard players add player_count _game_info 1

# Assign a number to each player
scoreboard players set _player_index _game_info 1
execute if score player_count _game_info >= _player_index _game_info run function swap:setup_player

# Set gamerules to false
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

effect clear @a

# Spread all players
tag @a remove center
tag @r add center

execute as @a[tag=center] run worldborder center ~ ~
worldborder set 5000

execute as @a[tag=center] run spreadplayers ~ ~ 100 2000 false @a

tag @a remove center

scoreboard players set game_running _game_info 1