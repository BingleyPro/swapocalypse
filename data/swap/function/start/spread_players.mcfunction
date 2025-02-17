$execute as @a[tag=center] run spreadplayers ~ ~ $(spread_distance) $(max_range) false @a[tag=!spectator]

$tellraw @a "Players spread with spread distance $(spread_distance) and max range $(max_range)"