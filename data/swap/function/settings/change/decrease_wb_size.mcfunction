$scoreboard players remove _settings_temp _game_info $(change)

execute store result storage swap:settings wb-size int 1 run scoreboard players get _settings_temp _game_info