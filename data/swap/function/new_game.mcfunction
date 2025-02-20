# Make sure the game isn't running
scoreboard players set game_running _game_info 0

scoreboard players set _awaiting_input _settings 0

# Setup scoreboards
scoreboard objectives add _game_info dummy
scoreboard objectives add _constant dummy
scoreboard objectives add _player_number dummy
scoreboard objectives add _deaths deathCount
scoreboard objectives add _online dummy
scoreboard objectives add _settings dummy
scoreboard objectives add _active_settings dummy
scoreboard objectives add input trigger

# Setup constant values
scoreboard players set 0 _constant 0
scoreboard players set 1 _constant 1
scoreboard players set 2 _constant 2
scoreboard players set 7 _constant 7
scoreboard players set 8 _constant 8
scoreboard players set 9 _constant 9
scoreboard players set 10 _constant 10
scoreboard players set 20 _constant 20
scoreboard players set 60 _constant 60
scoreboard players set 100 _constant 100
scoreboard players set 200 _constant 200
scoreboard players set 500 _constant 500
scoreboard players set 1000 _constant 1000
scoreboard players set 1500 _constant 1500
scoreboard players set 2000 _constant 2000
scoreboard players set 10000 _constant 10000
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
worldborder set 30
tag @a remove center
tag @r add center
execute as @a[tag=center] at @s run worldborder center ~ ~
execute as @a[tag=center] at @s run tp @a @s
execute as @a[tag=center] at @s run spreadplayers ~ ~ 2 10 false @a[tag=!center]
tag @a remove center

# Set the players' spawnpoints
execute as @a at @s run spawnpoint @s ~ ~ ~

# Reset player attributes
execute as @a run attribute @s jump_strength base set 0.42
execute as @a run attribute @s max_health base set 20

# Set all non-spectators to survival
gamemode survival @a[tag=!spectator]

# Clear actionbar
title @a actionbar [{"text":""}]

# Play sound
execute at @a[tag=op] run playsound minecraft:block.note_block.hat master @s ~ ~ ~ 0.7 1

# Show the settings menu
function swap:settings/show_settings