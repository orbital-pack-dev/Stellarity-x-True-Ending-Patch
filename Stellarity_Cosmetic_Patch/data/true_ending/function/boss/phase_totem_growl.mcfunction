playsound entity.ender_dragon.growl hostile @a[distance=..128] ~ ~ ~ 7 .6
playsound entity.ender_dragon.growl hostile @a[distance=..128] ~ ~ ~ 7 .5
playsound entity.ender_dragon.growl hostile @a[distance=..128] ~ ~ ~ 7 1

playsound ambient.basalt_deltas.mood hostile @a[distance=..128] ~ ~ ~ 6 .6
playsound ambient.basalt_deltas.mood hostile @a[distance=..128] ~ ~ ~ 6 .8
playsound ambient.basalt_deltas.mood hostile @a[distance=..128] ~ ~ ~ 6 1
playsound ambient.basalt_deltas.mood hostile @a[distance=..128] ~ ~ ~ 6 1.1
playsound ambient.basalt_deltas.mood hostile @a[distance=..128] ~ ~ ~ 6 1.2
playsound ambient.basalt_deltas.mood hostile @a[distance=..128] ~ ~ ~ 6 1.3

#particle dragon_breath ~ ~1.5 ~ 0 0 0 0.4 100 force @a[distance=..128]
#particle dragon_breath ~ ~1.5 ~ 0 0 0 0.2 100 force @a[distance=..128]
function true_ending:boss/shockwave/summon

# PATCH (п.1): снятие неуязвимости при growl только если кристаллов нет.
scoreboard players reset #ste_cos_crystals ste_cos.flags
execute in minecraft:the_end positioned 0 65 0 as @e[type=end_crystal,distance=..400,nbt={ShowBottom:1b}] run scoreboard players add #ste_cos_crystals ste_cos.flags 1
execute unless score #ste_cos_crystals ste_cos.flags matches 1.. run data modify entity @s Invulnerable set value 0b
