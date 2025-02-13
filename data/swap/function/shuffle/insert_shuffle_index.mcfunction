# Store both index and roll to temp storage
$execute store result storage swap:swap info.shuffle_index_temp int 1 run data get storage swap:swap list[$(index)]
$execute store result storage swap:swap info.shuffle_roll_temp int 1 run data get storage swap:swap list[$(roll)]

# Replace the current shuffle index to the shuffle roll
$data modify storage swap:swap list[$(index)] set from storage swap:swap info.shuffle_roll_temp

# Replace the current shuffle roll to the shuffle index
$data modify storage swap:swap list[$(roll)] set from storage swap:swap info.shuffle_index_temp