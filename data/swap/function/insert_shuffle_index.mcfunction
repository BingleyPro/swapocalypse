# Store both index and roll to temp storage
$execute store result score _shuffle_index_temp _game_info run data get storage swap:swap list[$(index)]
$execute store result score _shuffle_roll_temp _game_info run data get storage swap:swap list[$(roll)]

# Insert the current shuffle index to the shuffle roll
$data modify storage swap:swap list insert $(roll) value $(index)

data remove storage swap:swap list 