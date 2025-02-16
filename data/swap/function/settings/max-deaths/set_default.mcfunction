# -1 means automatic
data modify storage swap:settings max-deaths set value 3

# Play a sound
execute at @a[tag=op] run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1

function swap:settings/show_settings