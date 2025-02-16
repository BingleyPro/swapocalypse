# Save the input value to _input_value
scoreboard players set _input_value _settings 0
execute store result score _input_value _settings run scoreboard players get @a[tag=op,limit=1,scores={input=1..}] input

# Check if it's valid
execute if score _input_value _settings matches ..0 run return run function swap:settings/swap-interval/direct_set

# Check if it's within the standard range (20 - 10000)
execute if score _input_value _settings matches 20..10000 run return run function swap:settings/swap-interval/set

# Check if it's within the valid range (10 - 19 and 10001 - 50000)
execute if score _input_value _settings matches 10..19 run function swap:title
execute if score _input_value _settings matches 10..19 run return run tellraw @a[tag=op] [{"color":"gold","text":"Are you sure you would like to set the swap interval value to "},{"color":"light_purple","score":{"name":"_input_value","objective":"_settings"}},{"color":"gold","text":"?\n\n"},{"clickEvent":{"action":"run_command","value":"/function swap:settings/swap-interval/set"},"color":"green","text":"[Yes]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[No]"}]

execute if score _input_value _settings matches 10001..50000 run function swap:title
execute if score _input_value _settings matches 10001..50000 run return run tellraw @a[tag=op] [{"color":"gold","text":"Are you sure you would like to set the swap interval value to "},{"color":"light_purple","score":{"name":"_input_value","objective":"_settings"}},{"color":"gold","text":"?\n\n"},{"clickEvent":{"action":"run_command","value":"/function swap:settings/swap-interval/set"},"color":"green","text":"[Yes]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[No]"}]

# Otherwise, return nothing
return run function swap:settings/show_settings