# Display title
function swap:title

# Start button
tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:start"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"Click to begin!","color":"green"}]},"text":"[Start]"}

tellraw @a[tag=!op] {"color":"gray","hoverEvent":{"action":"show_text","value":[{"text":"You don't have permission to start the game!","color":"red"}]},"text":"[Start]"}

tellraw @a ""

# 1. Worldborder size
execute store result score _wb_size _settings run data get storage swap:settings wb_size

execute if score _wb_size _settings matches -1 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The size of the world as a square (wb size being each length)","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"Automatic","color":"gold"}]},"text":"Worldborder Size: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/direct_set"},"text":"Automatic"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

execute unless score _wb_size _settings matches -1 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/set_default"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The size of the world as a square (wb size being each length)","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"Automatic","color":"gold"}]},"text":"Worldborder Size: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/direct_set"},"nbt":"wb_size","storage":"swap:settings"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

execute if score _wb_size _settings matches -1 run tellraw @a[tag=!op] [{"color":"gray","text":"Worldborder Size: "},{"bold":true,"color":"gray","text":"< "},{"text":"Automatic","color":"gray"},{"bold":true,"color":"gray","text":" >"}]

execute unless score _wb_size _settings matches -1 run tellraw @a[tag=!op] [{"color":"gray","text":"Worldborder Size: "},{"bold":true,"color":"gray","text":"< "},{"nbt":"wb_size","storage":"swap:settings"},{"bold":true,"color":"gray","text":" >"}]

# 2. Max deaths
execute store result score _max_deaths _settings run data get storage swap:settings max_deaths

execute if score _max_deaths _settings matches 3 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The amount of deaths before a player is eliminated","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"3","color":"gold"}]},"text":"Max Deaths: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/direct_set"},"nbt":"max_deaths","storage":"swap:settings"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

execute unless score _max_deaths _settings matches 3 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/set_default"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The amount of deaths before a player is eliminated","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"3","color":"gold"}]},"text":"Max Deaths: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/direct_set"},"nbt":"max_deaths","storage":"swap:settings"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-deaths/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

tellraw @a[tag=!op] [{"color":"gray","text":"Max Deaths: "},{"bold":true,"color":"gray","text":"< "},{"nbt":"max_deaths","storage":"swap:settings"},{"bold":true,"color":"gray","text":" >"}]

# 3. Allow nether travel
execute store result score _nether_travel _settings run data get storage swap:settings nether_travel

execute if score _nether_travel _settings matches 1 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"If travelling to the Nether is enabled","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"true","color":"gold"}]},"text":"Allow Nether Travel: "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set to ","color":"green"},{"text":"false","color":"red"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/boolean/set_false {id:nether_travel}"},"text":"true","color":"green"}]

execute unless score _nether_travel _settings matches 1 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/boolean/set_true {id:nether_travel}"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"If travelling to the Nether is enabled","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"true","color":"gold"}]},"text":"Allow Nether Travel: "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set to ","color":"green"},{"text":"true","color":"dark_green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/boolean/set_true {id:nether_travel}"},"text":"false","color":"red"}]

execute if score _nether_travel _settings matches 1 run tellraw @a[tag=!op] [{"color":"gray","text":"Allow Nether Travel: true"}]

execute unless score _nether_travel _settings matches 1 run tellraw @a[tag=!op] [{"color":"gray","text":"Allow Nether Travel: false"}]

# 4. Swap interval
execute store result score _swap_interval _settings run data get storage swap:settings swap_interval

execute if score _swap_interval _settings matches 300 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The amount of time between each swap","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"300","color":"gold"},{"text":" seconds","color":"green"}]},"text":"Swap Interval: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/swap-interval/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/swap-interval/direct_set"},"nbt":"swap_interval","storage":"swap:settings"},{"text":"s","color":"gold","clickEvent":{"action":"run_command","value":"/return fail"},"hoverEvent": {"action":"show_text","value":{"text":""}}},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/swap-interval/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

execute unless score _swap_interval _settings matches 300 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/swap-interval/set_default"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The amount of time between each swap","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"300","color":"gold"},{"text":" seconds","color":"green"}]},"text":"Swap Interval: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/swap-interval/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/swap-interval/direct_set"},"nbt":"swap_interval","storage":"swap:settings"},{"text":"s","color":"gold","clickEvent":{"action":"run_command","value":"/return fail"},"hoverEvent": {"action":"show_text","value":{"text":""}}},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/swap-interval/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

tellraw @a[tag=!op] [{"color":"gray","text":"Swap Interval: "},{"bold":true,"color":"gray","text":"< "},{"nbt":"swap_interval","storage":"swap:settings"},{"bold":false,"color":"gray","text":"s"},{"bold":true,"color":"gray","text":" >"}]

# 5. Announce swap
execute store result score _announce_swap _settings run data get storage swap:settings announce_swap

execute if score _announce_swap _settings matches 1 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"How swap announcements are handled","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"Never","color":"gold"}]},"text":"Announce Swap: "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to change","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/show_announce_swap"},"text":"Never","color":"red"}]

execute if score _announce_swap _settings matches 2 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/choice/set-return {set:1,choice:announce_swap}"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"How swap announcements are handled","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"Never","color":"gold"}]},"text":"Announce Swap: "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to change","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/show_announce_swap"},"text":"5 Second Countdown","color":"green"}]

execute if score _announce_swap _settings matches 1 run tellraw @a[tag=!op] [{"color":"gray","text":"Announce Swap: Never"}]

execute if score _announce_swap _settings matches 2 run tellraw @a[tag=!op] [{"color":"gray","text":"Announce Swap: 5 Second Countdown"}]

# 6. Display timer
execute store result score _display_timer _settings run data get storage swap:settings display_timer

execute if score _display_timer _settings matches 1 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"How the game timer should be displayed","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"No Display","color":"gold"}]},"text":"Timer Display: "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to change","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/show_display_timer"},"text":"No Display","color":"red"}]

execute if score _display_timer _settings matches 2 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/choice/set-return {set:1,choice:display_timer}"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"How the game timer should be displayed","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"No Display","color":"gold"}]},"text":"Timer Display: "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to change","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/show_display_timer"},"text":"Show in Actionbar","color":"green"}]

execute if score _display_timer _settings matches 1 run tellraw @a[tag=!op] [{"color":"gray","text":"Timer Display: No Display"}]

execute if score _display_timer _settings matches 2 run tellraw @a[tag=!op] [{"color":"gray","text":"Timer Display: Show in Actionbar"}]

# 7. Number of hearts
execute store result score _max_health _settings run data get storage swap:settings max_health

execute if score _max_health _settings matches 20 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The amount of max half hearts each player will have","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"20","color":"gold"}]},"text":"Max Health: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-health/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/max-health/direct_set"},"nbt":"max_health","storage":"swap:settings"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-health/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

execute unless score _max_health _settings matches 20 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/max-health/set_default"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"The amount of max half hearts each player will have","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"20","color":"gold"}]},"text":"Max Health: "},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-health/adjust {input_change:1}"},"color":"red","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":"< "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set exact value","color":"green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/max-health/direct_set"},"nbt":"max_health","storage":"swap:settings"},{"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/max-health/adjust {input_change:2}"},"color":"green","hoverEvent":{"action":"show_text","value":[{"text":""}]},"text":" >"}]

tellraw @a[tag=!op] [{"color":"gray","text":"Max Health: "},{"bold":true,"color":"gray","text":"< "},{"nbt":"max_health","storage":"swap:settings"},{"bold":true,"color":"gray","text":" >"}]

# 8. Enable hunger
execute store result score _hunger _settings run data get storage swap:settings hunger

execute if score _hunger _settings matches 1 run tellraw @a[tag=op] [{"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"If hunger is enabled","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"true","color":"gold"}]},"text":"Enable Hunger: "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set to ","color":"green"},{"text":"false","color":"red"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/boolean/set_false {id:hunger}"},"text":"true","color":"green"}]

execute unless score _hunger _settings matches 1 run tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/boolean/set_true {id:hunger}"},"color":"gold","hoverEvent":{"action":"show_text","value":[{"text":"If hunger is enabled","color":"blue"},{"text":"\n\nClick to set to ","color":"green"},{"text":"true","color":"gold"}]},"text":"Enable Hunger: "},{"hoverEvent":{"action":"show_text","value":[{"text":"Click to set to ","color":"green"},{"text":"true","color":"dark_green"}]},"clickEvent":{"action":"run_command","value":"/function swap:settings/boolean/set_true {id:hunger}"},"text":"false","color":"red"}]

execute if score _hunger _settings matches 1 run tellraw @a[tag=!op] [{"color":"gray","text":"Enable Hunger: true"}]

execute unless score _hunger _settings matches 1 run tellraw @a[tag=!op] [{"color":"gray","text":"Enable Hunger: false"}]