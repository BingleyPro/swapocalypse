#execute store result score _input_value _settings run data get entity @a[tag=op,limit=1] Inventory[0].components.minecraft:writable_book_content.pages[0].raw

data modify storage swap:settings _temp set from entity @a[tag=op,limit=1] Inventory[0].components.minecraft:writable_book_content.pages[0].raw

execute store result score _input_value _settings run data get storage swap:settings _temp

# Check if it's within the standard range (100 - 1,000,000)
execute if score _input_value _settings matches 100..1000000 run return run function swap:settings/wb-size/set_wb_size

# Check if it's within the valid range (1 - 99 and 1,000,001 - 1,000,000,000)
execute if score _input_value _settings matches 1..99 run return run tellraw @a[tag=op] [{"color":"gold","text":"Are you sure you would like to set the worldborder value to this value?\n\n"},{"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/set_wb_size"},"color":"green","text":"[Yes]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[No]"}]

execute if score _input_value _settings matches 1000001..1000000000 run return run tellraw @a[tag=op] [{"color":"gold","text":"Are you sure you would like to set the worldborder value to this value?\n\n"},{"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/set_wb_size"},"color":"green","text":"[Yes]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[No]"}]

# Otherwise, return nothing
return run function swap:settings/show_settings