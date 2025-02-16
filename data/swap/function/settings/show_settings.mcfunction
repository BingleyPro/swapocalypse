# Display title
function swap:title

# Start button
tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:start"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"Click to begin!","color":"green"}]},"text":"[Start]"}

tellraw @a[tag=!op] {"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"You don't have permission to start the game!","color":"red"}]},"text":"[Start]"}

tellraw @a ""

# 1. Worldborder size
execute store result score _wb_size _settings run data get storage swap:settings wb-size

execute if score _wb_size _settings matches -1 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The size of the world as a square (wb size being each length)","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"Automatic","color":"gold"}]},"text":"Worldborder Size: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/direct_set"},"text":"Automatic"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

execute unless score _wb_size _settings matches -1 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/set_default"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The size of the world as a square (wb size being each length)","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"Automatic","color":"gold"}]},"text":"Worldborder Size: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/direct_set"},"nbt":"wb-size","storage":"swap:settings"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

tellraw @a[tag=!op] [{"color":"gray","text":"Worldborder Size: "},{"bold":true,"color":"gray","text":"< "},{"nbt":"wb-size","storage":"swap:settings"},{"bold":true,"color":"gray","text":" >"}]

# 2. Max deaths
execute store result score _max_deaths _settings run data get storage swap:settings max-deaths

execute if score _max_deaths _settings matches 3 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The amount of deaths before a player is eliminated","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"3","color":"gold"}]},"text":"Max Deaths: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/direct_set"},"nbt":"max-deaths","storage":"swap:settings"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

execute unless score _max_deaths _settings matches 3 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/set_default"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The amount of deaths before a player is eliminated","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"3","color":"gold"}]},"text":"Max Deaths: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/direct_set"},"nbt":"max-deaths","storage":"swap:settings"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

# 3. Allow nether travel

# 4. Swap interval

# 5. Announce swap

# 6. Display timer

# 7. Number of hearts

# 8. Disable hunger