# Detect when custom item is dropped on a bed and place it
execute as @e[type=item,tag=!blahaj_picked_up] if data entity @s Item.components.minecraft:custom_data.blahaj_stamp at @s if block ~ ~ ~ #minecraft:beds run function blahaj:place_toy

# Detect when toy is placed in a floor item frame (alternative check)
execute as @e[type=item_frame,nbt={Facing:1b}] if items entity @s contents *[custom_data~{blahaj_stamp:1b}] at @s run function blahaj:place_toy_frame

# Detect when display is no longer on a bed and drop it as item
execute as @e[tag=blahaj_toy,type=item_display] at @s unless block ~ ~-1 ~ #minecraft:beds unless entity @e[tag=blahaj_frame_placed,distance=..0.1] run function blahaj:drop_toy

# Detect right-click on placed toy - split behavior based on sneaking
execute as @e[type=minecraft:interaction,tag=blahaj.interaction] if data entity @s interaction at @s run function blahaj:interact_toy