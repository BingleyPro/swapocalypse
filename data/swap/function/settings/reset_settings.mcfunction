# Worldborder size (-1 = automatic)
data modify storage swap:settings wb_size set value -1
data modify storage swap:settings max_deaths set value 3

# 300 seconds = 5 minutes
data modify storage swap:settings swap_interval set value 300

# 20 = 10 hearts
data modify storage swap:settings max_health set value 20

# 1 = true
data modify storage swap:settings nether_travel set value 1
data modify storage swap:settings hunger set value 1

# 1 = no display
data modify storage swap:settings display_timer set value 1

# 1 = never
data modify storage swap:settings announce_swap set value 1