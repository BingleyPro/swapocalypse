# Display title
tellraw @a "\n\n\n\n\n\n\n\n\n\n\n\n"
tellraw @a [{"color":"#E02951","text":"-"},{"color":"#D3264C","text":"-"},{"color":"#C52446","text":"- "},{"color":"#B82141","text":"D"},{"color":"#AB1E3B","text":"e"},{"color":"#9E1B36","text":"a"},{"color":"#901931","text":"t"},{"color":"#83162B","text":"h "},{"color":"#761326","text":"S"},{"color":"#691020","text":"w"},{"color":"#5B0E1B","text":"a"},{"color":"#4E0B16","text":"p "},{"color":"#410810","text":"-"},{"color":"#34050B","text":"-"},{"color":"#190000","text":"-"}]

tellraw @a [{"color":"gray","italic":true,"text":"v0.1 for 1.21.4 by "},{"color":"#FF930F","text":"B"},{"color":"#FFA21A","text":"i"},{"color":"#FFB025","text":"n"},{"color":"#FFBF30","text":"g"},{"color":"#FFCD3A","text":"l"},{"color":"#FFDC45","text":"e"},{"color":"#FFF95B","text":"y"}]

# Setup worldborder
execute at @r run worldborder center ~ ~
worldborder set 15

# Setup scoreboards
scoreboard objectives add _game_info dummy
scoreboard objectives add _constant dummy
scoreboard objectives add _player_number dummy

scoreboard players set game_running _game_info 0

# 5 mins = 6000 ticks
scoreboard players set swap_countdown _game_info 6000

scoreboard players set 0 _constant 0
scoreboard players set 1 _constant 1

scoreboard players reset * _player_number

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
worldborder set 40
tag @a remove center
tag @r add center
execute as @a[tag=center] run worldborder center ~ ~
execute as @a[tag=center] run spreadplayers ~ ~ 2 15 false @a[tag=!center]
tag @a remove center

# Set the players' spawnpoints
execute as @a at @s run spawnpoint @s ~ ~ ~

# Allow players to jump
execute as @a run attribute @s jump_strength base set 0.42

gamemode survival @a

#function swap:debug