# Check if a toy already exists at this position - if so, exit early
execute align xyz positioned ~0.5 ~1.06 ~0.5 if entity @e[tag=blahaj_toy,distance=..0.5] run return 0

# Summon item_display at bed center, slightly above
execute align xyz positioned ~0.5 ~0.06 ~0.5 run summon item_display ~ ~1 ~ {Tags:["blahaj_toy","blahaj_temp"]}

# Tag the item entity so we can reference it
tag @s add blahaj_item

# Copy item data to display entity
execute as @e[tag=blahaj_temp,sort=nearest,limit=1] at @s run function blahaj:place_toy_post

# Remove the item entity
kill @s

# Play placement sound
playsound minecraft:block.wool.place block @a ~0.5 ~0.06 ~0.5 1