# Save the input value to _input_value
scoreboard players set _input_value _settings 0
execute store result score _input_value _settings run scoreboard players get @a[tag=op,limit=1,scores={input=1..}] input

# Check if it's valid
execute if score _input_value _settings matches ..0 run return run function swap:settings/wb-size/direct_set

# Check if it's within the standard range (100 - 1,000,000)
execute if score _input_value _settings matches 100..1000000 run return run function swap:settings/wb-size/set

# Check if it's within the valid range (1 - 99 and 1,000,001 - 1,000,000,000)
execute if score _input_value _settings matches 1..99 run function swap:title
execute if score _input_value _settings matches 1..99 run return run tellraw @a[tag=op] [{"color":"gold","text":"Are you sure you would like to set the worldborder value to "},{"color":"light_purple","score":{"name":"_input_value","objective":"_settings"}},{"color":"gold","text":"?\n\n"},{"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/set"},"color":"green","text":"[Yes]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[No]"}]

execute if score _input_value _settings matches 1000001..1000000000 run function swap:title
execute if score _input_value _settings matches 1000001..1000000000 run return run tellraw @a[tag=op] [{"color":"gold","text":"Are you sure you would like to set the worldborder value to "},{"color":"light_purple","score":{"name":"_input_value","objective":"_settings"}},{"color":"gold","text":"?\n\n"},{"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/set"},"color":"green","text":"[Yes]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[No]"}]

# Otherwise, return nothing
return run function swap:settings/show_settings