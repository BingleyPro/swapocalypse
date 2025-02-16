# Get the type of input change (decrease (1), increase (2))
$scoreboard players set _input_type _settings $(input_change)

# Retrieve the current wb-size into _settings_temp
execute store result score _settings_temp _game_info run data get storage swap:settings swap_interval

scoreboard players set _step_size _settings 10

# Distinct step sizes for increasing (2)
execute if score _input_type _settings matches 2 if score _settings_temp _game_info matches 20..99 run scoreboard players set _step_size _settings 10
execute if score _input_type _settings matches 2 if score _settings_temp _game_info matches 100..499 run scoreboard players set _step_size _settings 50
execute if score _input_type _settings matches 2 if score _settings_temp _game_info matches 500..999 run scoreboard players set _step_size _settings 100
execute if score _input_type _settings matches 2 if score _settings_temp _game_info matches 1000..9999 run scoreboard players set _step_size _settings 500

# Distinct step sizes for decreasing (1)
execute if score _input_type _settings matches 1 if score _settings_temp _game_info matches 21..100 run scoreboard players set _step_size _settings 10
execute if score _input_type _settings matches 1 if score _settings_temp _game_info matches 101..400 run scoreboard players set _step_size _settings 50
execute if score _input_type _settings matches 1 if score _settings_temp _game_info matches 501..1000 run scoreboard players set _step_size _settings 100
execute if score _input_type _settings matches 1 if score _settings_temp _game_info matches 1001..10000 run scoreboard players set _step_size _settings 500

# Calculate how much to reach the next step boundary
execute store result score _remainder _settings run scoreboard players get _settings_temp _game_info
scoreboard players operation _remainder _settings %= _step_size _settings

# If remainder is 0, just add the step size. Otherwise, add (step_size - remainder)
execute if score _remainder _settings matches 0 run scoreboard players operation _temp _settings = _step_size _settings
execute if score _remainder _settings matches 1.. run scoreboard players operation _temp _settings = _step_size _settings
execute if score _input_type _settings matches 2 if score _remainder _settings matches 1.. run scoreboard players operation _temp _settings -= _remainder _settings
execute if score _input_type _settings matches 1 if score _remainder _settings matches 1.. run scoreboard players operation _temp _settings = _remainder _settings

execute if score _input_type _settings matches 1 run scoreboard players operation _settings_temp _game_info -= _temp _settings

execute if score _input_type _settings matches 2 run scoreboard players operation _settings_temp _game_info += _temp _settings

# Clamp values
execute if score _settings_temp _game_info < 20 _constant run scoreboard players set _settings_temp _game_info 20
execute if score _settings_temp _game_info > 10000 _constant run scoreboard players set _settings_temp _game_info 10000

# Save the new value to storage
execute store result storage swap:settings swap_interval int 1 run scoreboard players get _settings_temp _game_info

# Play a sound
execute at @a[tag=op] run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1

# Show settings
function swap:settings/show_settings