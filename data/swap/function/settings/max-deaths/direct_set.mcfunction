# Display title
function swap:title

# Reset player input check
scoreboard players enable @a[tag=op] input
scoreboard players set @a input 0

# Display instructions
tellraw @a[tag=op] [{"color":"aqua","text":"Run the command "},{"color":"gold","text":"/trigger input set [new max deaths]"},{"color":"aqua","text":" !"}]
tellraw @a[tag=op] ""
tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/check_set"},"color":"green","text":"[Finish]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[Cancel]"}]