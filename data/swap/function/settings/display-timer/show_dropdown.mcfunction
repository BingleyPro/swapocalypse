# Display title
function swap:title

# Display instructions
tellraw @a[tag=op] [{"color":"gold","text":"Display Timer:\n"}]

execute store result score _settings_temp _settings run data get storage swap:settings display_timer

execute unless score _settings_temp _settings matches 1 run tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:settings/display-timer/set {set:1}"},"color":"red","text":"[No Display]"}
execute if score _settings_temp _settings matches 1 run tellraw @a[tag=op] {"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/display-timer/set {set:1}"},"color":"red","text":"[No Display]"}

execute unless score _settings_temp _settings matches 2 run tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:settings/display-timer/set {set:2}"},"color":"green","text":"[Show in Actionbar]"}
execute if score _settings_temp _settings matches 2 run tellraw @a[tag=op] {"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/display-timer/set {set:2}"},"color":"green","text":"[Show in Actionbar]"}

tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"green","text":"\n[Finish]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/display-timer/set {set:1}"},"color":"red","text":"[Reset to Default]"}]