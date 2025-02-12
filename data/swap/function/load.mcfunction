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

# Manage effects
effect clear @a
effect give @a resistance infinite 255 true
effect give @a saturation infinite 255 true
effect give @a regeneration infinite 255 true
effect give @a water_breathing infinite 255 true

gamemode survival @a