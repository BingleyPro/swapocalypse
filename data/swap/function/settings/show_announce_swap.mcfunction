# Display title
function swap:title

# Display instructions
tellraw @a[tag=op] [{"color":"gold","text":"Announce Swap:\n"}]

execute store result score _settings_temp _settings run data get storage swap:settings announce_swap

execute unless score _settings_temp _settings matches 1 run tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:settings/choice/set {set:1,choice:announce_swap}"},"color":"red","text":"[Never]"}
execute if score _settings_temp _settings matches 1 run tellraw @a[tag=op] {"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/choice/set {set:1,choice:announce_swap}"},"color":"red","text":"[Never]"}

execute unless score _settings_temp _settings matches 2 run tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:settings/choice/set {set:2,choice:announce_swap}"},"color":"green","text":"[5 Second Countdown]"}
execute if score _settings_temp _settings matches 2 run tellraw @a[tag=op] {"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/choice/set {set:2,choice:announce_swap}"},"color":"green","text":"[5 Second Countdown]"}

tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"green","text":"\n[Finish]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/choice/set {set:2,choice:announce_swap}"},"color":"red","text":"[Reset to Default]"}]

# For non-ops
tellraw @a[tag=!op] [{"color":"gray","text":"Announce Swap:\n"}]

execute unless score _settings_temp _settings matches 1 run tellraw @a[tag=!op] {"color":"gray","text":"[Never]"}
execute if score _settings_temp _settings matches 1 run tellraw @a[tag=!op] {"bold":true,"color":"gray","text":"[Never]"}

execute unless score _settings_temp _settings matches 2 run tellraw @a[tag=!op] {"color":"gray","text":"[5 Second Countdown]"}
execute if score _settings_temp _settings matches 2 run tellraw @a[tag=!op] {"bold":true,"color":"gray","text":"[5 Second Countdown]"}

tellraw @a[tag=!op] [{"color":"gray","text":"\n[Finish]"},"     ",{"color":"gray","text":"[Reset to Default]"}]

function swap:sounds/ui_click1