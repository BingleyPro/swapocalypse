# Get the type of input change (decrease (1), increase (2))
$scoreboard players set _input_type _settings $(input_change)

# Retrieve the current wb-size into _settings_temp
execute store result score _settings_temp _game_info run data get storage swap:settings max-deaths

scoreboard players set _step_size _settings 100

# Distinct step sizes for increasing (2)
execute if score _input_type _settings matches 2 if score _settings_temp _game_info matches 1..9 run scoreboard players set _step_size _settings 1
execute if score _input_type _settings matches 2 if score _settings_temp _game_info matches 10..19 run scoreboard players set _step_size _settings 2
execute if score _input_type _settings matches 2 if score _settings_temp _game_info matches 20..199 run scoreboard players set _step_size _settings 10

# Distinct step sizes for decreasing (1)
execute if score _input_type _settings matches 1 if score _settings_temp _game_info matches 2..10 run scoreboard players set _step_size _settings 1
execute if score _input_type _settings matches 1 if score _settings_temp _game_info matches 11..20 run scoreboard players set _step_size _settings 2
execute if score _input_type _settings matches 1 if score _settings_temp _game_info matches 21..200 run scoreboard players set _step_size _settings 10

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
execute if score _settings_temp _game_info < 1 _constant run scoreboard players set _settings_temp _game_info 1
execute if score _settings_temp _game_info > 200 _constant run scoreboard players set _settings_temp _game_info 200

# Save the new value to storage
execute store result storage swap:settings max-deaths int 1 run scoreboard players get _settings_temp _game_info

# Play a sound
execute at @a[tag=op] run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1

# Show settings
function swap:settings/show_settings