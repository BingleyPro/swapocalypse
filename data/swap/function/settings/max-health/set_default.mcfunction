# 20 = 10 hearts
data modify storage swap:settings max_health set value 20

# Play a sound
execute at @a[tag=op] run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1

function swap:settings/show_settings