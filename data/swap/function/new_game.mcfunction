# Show the settings menu
function swap:settings/show_settings

# Make sure the game isn't running
scoreboard players set game_running _game_info 0

# Setup scoreboards
scoreboard objectives add _game_info dummy
scoreboard objectives add _constant dummy
scoreboard objectives add _player_number dummy
scoreboard objectives add _deaths deathCount
scoreboard objectives add _online dummy
scoreboard objectives add _settings dummy

# 5 mins = 6000 ticks
scoreboard players set swap_countdown _game_info 6000

# Setup constant values
scoreboard players set 0 _constant 0
scoreboard players set 1 _constant 1
scoreboard players set 100 _constant 100
scoreboard players set 500 _constant 500
scoreboard players set 1000 _constant 1000
scoreboard players set 1500 _constant 1500
scoreboard players set 2000 _constant 2000
scoreboard players set 20000 _constant 20000
scoreboard players set 200000 _constant 200000
scoreboard players set 1000000 _constant 1000000

# Reset player count
scoreboard players set final_player_count _game_info -1

# Reset player numbers
scoreboard players reset * _player_number

# Remove tags from players
tag @a remove setup_player
tag @a remove player

# Revoke advancements
advancement revoke @a everything

# Set gamerules to false
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule doMobSpawning false
gamerule mobGriefing false
gamerule doMobLoot false
gamerule doTileDrops false
gamerule doEntityDrops false
gamerule doFireTick false
gamerule fallDamage false
gamerule fireDamage false
gamerule drowningDamage false
gamerule showDeathMessages false
gamerule doVinesSpread false

# Set the time to day
time set day

# Give all players effects to stay alive
effect clear @a
effect give @a resistance infinite 255 true
effect give @a saturation infinite 255 true
effect give @a regeneration infinite 255 true
effect give @a water_breathing infinite 255 true

# Setup the world border
worldborder set 20
tag @a remove center
tag @r add center
execute as @a[tag=center] run worldborder center ~ ~
execute as @a[tag=center] run tp @a @s
execute as @a[tag=center] run spreadplayers ~ ~ 2 15 false @a[tag=!center]
tag @a remove center

# Set the players' spawnpoints
execute as @a at @s run spawnpoint @s ~ ~ ~

# Allow players to jump
execute as @a run attribute @s jump_strength base set 0.42

# Set all non-spectators to survival
gamemode survival @a[tag=!spectator]