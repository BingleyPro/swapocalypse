# If the game is not running, teleport them to worldborder center and set spawn
execute if score game_running _game_info matches 0 run tp @s @r[scores={joined=1}]

# If the game is running, set them to spectator
execute if score game_running _game_info matches 1 run tag @s add spectator
execute if score game_running _game_info matches 1 run tag @s remove player

# Mark the player as handled
scoreboard players set @s joined 1
