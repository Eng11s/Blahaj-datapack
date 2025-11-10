# Check if this was a frame placement and prepare to drop frame
execute if entity @e[tag=blahaj_toy,tag=blahaj_frame_placed,sort=nearest,distance=..0.6] run tag @s add blahaj_needs_frame

# Drop the toy as an item
execute as @e[tag=blahaj_toy,sort=nearest,distance=..0.6] at @s run function blahaj:drop_toy

# If this was a frame placement, also drop an item frame
execute if entity @s[tag=blahaj_needs_frame] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1},Tags:["blahaj_frame_drop"]}

# Tag the dropped items to prevent re-placement
tag @e[type=item,distance=..2,nbt={Item:{components:{"minecraft:custom_data":{blahaj_stamp:1b}}}}] add blahaj_picked_up

# Tag the frame item so it also gets teleported
tag @e[type=item,tag=blahaj_frame_drop,distance=..2] add blahaj_picked_up
tag @e[type=item,tag=blahaj_frame_drop] remove blahaj_frame_drop

# Teleport items to the specific player who clicked (using macro)
function blahaj:teleport_to_player with entity @s interaction

# Clear the interaction data
data remove entity @s interaction

# Remove the interaction entity
kill @s