# Save player 0's position into storage
$execute if score _swap_index _game_info matches 0 run execute store result storage swap:swap info.player0PosX double 1 run data get entity @a[limit=1,scores={_player_number=$(s_playerInt1)}] Pos[0]

$execute if score _swap_index _game_info matches 0 run execute store result storage swap:swap info.player0PosY double 1 run data get entity @a[limit=1,scores={_player_number=$(s_playerInt1)}] Pos[1]

$execute if score _swap_index _game_info matches 0 run execute store result storage swap:swap info.player0PosZ double 1 run data get entity @a[limit=1,scores={_player_number=$(s_playerInt1)}] Pos[2]

$tp @a[limit=1,scores={_player_number=$(s_playerInt1)}] @a[limit=1,scores={_player_number=$(s_playerInt2)}]