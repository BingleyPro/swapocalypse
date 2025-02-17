# Get the number of the players
scoreboard players set player_count _game_info 0
execute as @a[tag=!spectator] run scoreboard players add player_count _game_info 1

execute store result score final_player_count _game_info run scoreboard players get player_count _game_info

# Execute if the player count is 1
execute unless score final_player_count _game_info matches 1 run return fail

# Stop the game running
scoreboard players set game_running _game_info 0

# Reset the player count
scoreboard players set final_player_count _game_info -1

# Display the win event message!
tellraw @a "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
tellraw @a [{"bold":true,"color":"gold","selector":"@a[tag=player,limit=1]"},{"bold":false,"color":"green","text":" has won the event!"}]
tellraw @a ""

# Firework!
execute at @a[tag=player,limit=1] run summon firework_rocket ~ ~ ~ {FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"star",has_twinkle:true,has_trail:true,colors:[I;16733225,11796272,5427711,16013823],fade_colors:[I;14286836,16768980]}]}}}}

# Display new game prompt for ops
tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:new_game"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"Will end any currently running game!","color":"red"}]},"text":"[New Game]"}

# And for non-ops
tellraw @a[tag=!op] {"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Only operators can create a new game - if you are an operator run '/tag @s add op'","color":"red"}]},"text":"[New Game]"}

# Give all players effects to stay alive
effect clear @a
effect give @a resistance infinite 255 true
effect give @a saturation infinite 255 true
effect give @a regeneration infinite 255 true
effect give @a water_breathing infinite 255 true
effect give @a night_vision infinite 255 true

tag @a remove spectator