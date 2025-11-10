# Tag display for reference
tag @s add blahaj_despawn

# Summon item entity below the display
summon item ~ ~-0.5 ~ {Tags:["blahaj_item_spawn"],Item:{id:"minecraft:feather",count:1}}

# Copy item data from display to item entity
execute as @e[tag=blahaj_item_spawn] at @s run data modify entity @s Item set from entity @e[type=minecraft:item_display,limit=1,sort=nearest,tag=blahaj_despawn] item

# Remove spawn tag
tag @e[tag=blahaj_item_spawn] remove blahaj_item_spawn

# Remove interaction entity
kill @e[tag=blahaj.interaction,sort=nearest,limit=1,distance=..0.5]

# Remove display entity
kill @s