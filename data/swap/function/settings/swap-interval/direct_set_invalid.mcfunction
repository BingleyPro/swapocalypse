# Display title
function swap:title

# Reset player input check
scoreboard players enable @a[tag=op] input
scoreboard players set @a input 0

# Display instructions
tellraw @a[tag=op] [{"color":"red","text":"Your input is invalid! Please enter a valid number."}]
tellraw @a[tag=op] ""
tellraw @a[tag=op] [{"color":"aqua","text":"Run the command "},{"color":"gold","text":"/trigger input set [new swap interval]"},{"color":"aqua","text":" !"}]
tellraw @a[tag=op] ""
tellraw @a[tag=op] [{"color":"gold","text":"The valid range is "},{"color":"red","text":"10 - 50,000 (seconds)"},", but it's recommended to go between ",{"color":"red","text":"20 - 10,000 (seconds)"},{"color":"gold","text":". (only include the raw number, and not 's')"}]
tellraw @a[tag=op] ""
tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[Cancel]"}]

scoreboard players set _awaiting_input _settings 1
data modify storage swap:settings direct_set_change set value "swap-interval"