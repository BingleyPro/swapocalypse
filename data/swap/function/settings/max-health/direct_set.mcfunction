# Display title
function swap:title

# Reset player input check
scoreboard players enable @a[tag=op] input
scoreboard players set @a input 0

# Display instructions
tellraw @a[tag=op] [{"color":"aqua","text":"Run the command "},{"color":"gold","text":"/trigger input set [new max health]"},{"color":"aqua","text":" !"}]
tellraw @a[tag=op] ""
tellraw @a[tag=op] [{"color":"gold","text":"The valid range is "},{"color":"red","text":"1 - 1,024"},", but it's recommended to go between ",{"color":"red","text":"1 - 100"}]
tellraw @a[tag=op] ""
tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[Cancel]"}]

scoreboard players set _awaiting_input _settings 1
data modify storage swap:settings direct_set_change set value "max-health"