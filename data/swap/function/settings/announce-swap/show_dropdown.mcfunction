# Display title
function swap:title

# Display instructions
tellraw @a[tag=op] [{"color":"gold","text":"Announce Swap:\n"}]

execute store result score _settings_temp _settings run data get storage swap:settings announce_swap

execute unless score _settings_temp _settings matches 1 run tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:settings/announce-swap/set {set:1}"},"color":"red","text":"[Never]"}
execute if score _settings_temp _settings matches 1 run tellraw @a[tag=op] {"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/announce-swap/set {set:1}"},"color":"red","text":"[Never]"}

execute unless score _settings_temp _settings matches 2 run tellraw @a[tag=op] {"clickEvent":{"action":"run_command","value":"/function swap:settings/announce-swap/set {set:2}"},"color":"green","text":"[5 Second Countdown]"}
execute if score _settings_temp _settings matches 2 run tellraw @a[tag=op] {"bold":true,"clickEvent":{"action":"run_command","value":"/function swap:settings/announce-swap/set {set:2}"},"color":"green","text":"[5 Second Countdown]"}

tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"green","text":"\n[Finish]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/announce-swap/set {set:1}"},"color":"red","text":"[Reset to Default]"}]