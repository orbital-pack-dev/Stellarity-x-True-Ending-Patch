# true_ending:respawning/place_end_crystal
advancement revoke @s only true_ending:place_end_crystal_on_bedrock

execute in minecraft:the_end positioned 0 62 0 if entity @s[distance=..8] as @e[type=end_crystal,distance=..4.5,limit=1,sort=nearest] at @s run playsound block.end_portal_frame.fill block @a[distance=..32] ~ ~ ~ 1.5 1
execute in minecraft:the_end positioned 0 62 0 if entity @s[distance=..8] as @e[type=end_crystal,distance=..4.5,limit=1,sort=nearest] at @s run function true_ending:respawning/place_end_crystal_hit
