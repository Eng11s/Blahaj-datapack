# Check if the clicking player is sneaking (without changing context)
$execute if entity @p[nbt={UUID:$(player)},predicate=blahaj:is_sneaking] run return run function blahaj:pickup_toy

# If not sneaking, play sound, grant advancement, and clear interaction
playsound blahaj:toy.interact neutral @a ~ ~ ~ 1.0 1.0
$advancement grant @p[nbt={UUID:$(player)}] only blahaj:squeak
data remove entity @s interaction