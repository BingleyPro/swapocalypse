# Get the type of input change (increase (1), decrease (2), directly set (3))
$scoreboard players set _input_type _settings $(input_change)

# Get the input for change
scoreboard players set _input_value _settings -1
$scoreboard players set _input_value _settings $(input_value)

# If directly set, check if it's within the standard range (100 - 1,000,000)
execute if score _input_type _settings matches 3 if score _input_value _settings matches 100..1000000 run return run data modify storage swap:settings wb-size set value _input_value

# Otherwise, check if it's within the valid range (1 - 99 and 1,000,001 - 1,000,000,000)
execute if score _input_type _settings matches 3 if score _input_value _settings matches 1..99 run return fail
execute if score _input_type _settings matches 3 if score _input_value _settings matches 1000001..1000000000 run return fail

# Otherwise, return nothing
execute if score _input_type _settings matches 3 run return fail