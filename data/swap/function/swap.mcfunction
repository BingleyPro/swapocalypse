# Make a list of numbers from 1 to _player_count
data modify storage swap:swap list set value []
scoreboard players set _player_index _game_info 1
function swap:build_list