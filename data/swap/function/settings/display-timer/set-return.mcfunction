$data modify storage swap:settings display_timer set value $(set)

# Play a sound
execute at @a[tag=op] run playsound minecraft:ui.button.click master @s ~ ~ ~ 0.3 1

function swap:settings/show_settings