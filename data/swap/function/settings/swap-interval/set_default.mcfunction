# 300 seconds = 5 minutes
data modify storage swap:settings swap_interval set value 300

# Play a sound
execute at @a[tag=op] run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1

function swap:settings/show_settings