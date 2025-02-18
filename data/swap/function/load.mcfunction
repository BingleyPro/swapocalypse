# load.mcfunction runs on /reload

# Display main title
function swap:title

# Display new game prompt for ops
tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:new_game"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"Will end any currently running game!","color":"red"}]},"text":"[New Game]"}

# And for non-ops
tellraw @a[tag=!op] {"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"Only operators can create a new game - if you are an operator run '/tag @s add op'","color":"red"}]},"text":"[New Game]"}

# Setup settings if they don't already exist
execute unless data storage swap:settings wb_size run function swap:settings/reset_settings

gamerule sendCommandFeedback false