# Check if a toy already exists at this position - if so, drop the frame and item back
execute if entity @e[tag=blahaj_toy,distance=..0.5] run return run function blahaj:drop_frame_with_item

# Tag the item frame so we can reference it
tag @s add blahaj_frame_temp

# Summon item_display at frame position
summon item_display ~ ~0.47 ~ {Tags:["blahaj_toy","blahaj_frame_placed","blahaj_temp"]}

# Copy item data to display entity and set rotation
execute as @e[tag=blahaj_temp,sort=nearest,limit=1] at @s run function blahaj:place_toy_frame_post

# Remove the item frame
kill @s

# Play placement sound
playsound minecraft:block.wool.place block @a ~ ~ ~ 1