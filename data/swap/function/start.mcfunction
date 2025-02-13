# --- On Game Start --- #

# Get the number of the players
scoreboard players set player_count _game_info 0
execute as @a[tag=player] run scoreboard players add player_count _game_info 1

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

# Setup the world border
worldborder set 3000

# Spread All Players