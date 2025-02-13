# Worldborder size (-1 = automatic)
execute store result score _settings_temp _game_info run data get storage swap:settings wb-size

execute if score _settings_temp _game_info matches -1 run return fail

execute if score _settings_temp _game_info >= 200000 _constant run return fail

# 20000 - 200001
execute if score _settings_temp _game_info >= 20000 _constant run return run function swap:settings/change/increase_wb_size {change: 10000}

# 1500 - 19999
execute if score _settings_temp _game_info >= 1500 _constant run return run function swap:settings/change/increase_wb_size {change: 1000}

# 1000 - 1499
execute if score _settings_temp _game_info >= 1000 _constant run return run function swap:settings/change/increase_wb_size {change: 500}

# 500 - 999
execute if score _settings_temp _game_info >= 500 _constant run return run function swap:settings/change/increase_wb_size {change: 250}

# 100 - 499
execute if score _settings_temp _game_info >= 100 _constant run return run function swap:settings/change/increase_wb_size {change: 100}