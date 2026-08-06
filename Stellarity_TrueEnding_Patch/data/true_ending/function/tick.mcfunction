# COUNTERS AND CLOCKS
scoreboard players add 1min trueEnding_clock 1
scoreboard players add 20tick trueEnding_clock 1
scoreboard players add 10tick trueEnding_clock 1
scoreboard players add 2tick trueEnding_clock 1
scoreboard players add 5tick trueEnding_clock 1

#dragon
execute as @e[type=ender_dragon,tag=!trueEnding_mirrordragon,tag=!trueEnding_dragon_noAI] if data entity @s DragonPhase at @s run function true_ending:boss/a_main

#xp
execute in the_end positioned 0 90 0 as @e[distance=..24,type=experience_orb] run function true_ending:other/xp

######################################################################################################

execute as @e[type=marker,tag=trueEnding_ultrafireball] at @s run function true_ending:boss/ultra_fireball
execute as @e[type=marker,tag=trueEnding_shockwave] at @s run function true_ending:boss/shockwave/root
execute as @e[type=marker,tag=trueEnding_shockwave2] at @s run function true_ending:boss/shockwave/root2
execute as @e[type=marker,tag=trueEnding_pad] at @s run function true_ending:boss/shockwave/pad

execute as @e[type=phantom,tag=trueEnding_guardphantom] at @s run function true_ending:boss/phantom/entity

execute as @e[type=ender_dragon,tag=trueEnding_mirrordragon] at @s run function true_ending:boss/dive/decoy_enderdragon

######################################################################################################

#new dragon fireball
execute in the_end positioned 0 80 0 as @e[type=dragon_fireball,distance=..256] at @s as @n[type=ender_dragon,tag=trueEnding_dragon_particlechecked] at @s run function true_ending:boss/summon_ultra_fireball

#player
execute as @a[scores={trueEnding_settings.dragonhealth=-2147483648..2147483647}] at @s run function true_ending:settings/set_value_dragonhealth

execute in the_end positioned 0 80 0 as @e[type=marker,tag=trueEnding_endspike,tag=!trueEnding_endspike_caged,distance=..128] at @s if loaded ~ ~ ~ run function true_ending:boss/phantom/summon
