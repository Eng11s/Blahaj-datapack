# Copy item from item entity to display entity
data modify entity @s item set from entity @e[type=minecraft:item,limit=1,sort=nearest,tag=blahaj_item] Item

# Rotate display to face nearest player
rotate @s facing entity @e[type=minecraft:player,limit=1,sort=nearest] feet

# Set pitch to 0 (keep it flat)
data modify entity @s Rotation[1] set value 0f

# Remove temp tag
tag @s remove blahaj_temp

# Grant advancement to nearest player
advancement grant @p[distance=..5] only blahaj:resting_place

# Check if interaction already exists nearby, if so skip
execute as @e[tag=blahaj.interaction,sort=nearest,limit=1,distance=..0.5] run return 0

# Summon interaction entity for pickup
summon interaction ~ ~-0.5 ~ {width:0.5f,height:0.25f,response:1b,Tags:["blahaj.interaction"]}