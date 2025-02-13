# Display title
function swap:title

# Start button
tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:start"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"Click to begin!","color":"green"}]},"text":"[Start]"}

tellraw @a[tag=!op] {"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"You don't have permission to start the game!","color":"red"}]},"text":"[Start]"}

tellraw @a ""

# Worldborder size
tellraw @a[tag=op] [{"color":"gold","text":"Worldborder Size: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/decrease_wb_size"},"color":"red","text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"nbt":"wb-size","storage":"swap:settings"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/increase_wb_size"},"color":"green","text":" >"}]

tellraw @a[tag=!op] [{"color":"gray","text":"Worldborder Size: "},{"bold":true,"color":"gray","text":"< "},{"nbt":"wb-size","storage":"swap:settings"},{"bold":true,"color":"gray","text":" >"}]

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
scoreboard players set 100 _constant 100

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