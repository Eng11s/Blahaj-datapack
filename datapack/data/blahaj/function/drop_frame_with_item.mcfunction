# Drop the toy item
summon item ~ ~ ~ {Item:{id:"minecraft:feather",count:1}}
data modify entity @e[type=item,sort=nearest,limit=1] Item set from entity @s Item

# Drop a regular item frame
summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",count:1}}

# Remove the frame entity
kill @s