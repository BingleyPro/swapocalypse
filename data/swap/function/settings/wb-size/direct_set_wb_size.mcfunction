# Give players a book to write the new worldborder size
give @a[tag=op] writable_book

# Display title
function swap:title

# Display instructions
tellraw @a[tag=op] {"color":"aqua","text":"Write the new worldborder size in the first line of the book!"}
tellraw @a[tag=op] ""
tellraw @a[tag=op] [{"clickEvent":{"action":"run_command","value":"/function swap:settings/wb-size/check_set_wb_size"},"color":"green","text":"[Finish]"},"     ",{"clickEvent":{"action":"run_command","value":"/function swap:settings/show_settings"},"color":"red","text":"[Cancel]"}]