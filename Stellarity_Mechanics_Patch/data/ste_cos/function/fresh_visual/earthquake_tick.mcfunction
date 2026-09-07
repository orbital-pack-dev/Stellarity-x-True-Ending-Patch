# ste_cos:fresh_visual/earthquake_tick
# дрожь земли

# теги сущностей
execute as @e[type=!end_crystal,type=!marker,type=!block_display,type=!text_display,type=!item_display,type=!interaction,type=!area_effect_cloud,type=!ender_dragon,type=!armor_stand,distance=..180,tag=!ste_cos.earthquake_shaken] run tag @s add ste_cos.earthquake_shaken
execute as @e[type=!end_crystal,type=!marker,type=!block_display,type=!text_display,type=!item_display,type=!interaction,type=!area_effect_cloud,type=!ender_dragon,type=!armor_stand,distance=..180,tag=!stellarity.dragon.screenshake] run tag @s add stellarity.dragon.screenshake

# тряска экрана
execute as @a[tag=stellarity.dragon.screenshake] at @s run function stellarity:entity/dragon/spawn/screenshake/tick_up

# вибрация сущностей
scoreboard players add #earthquake_dir ste_cos.flags 1
execute if score #earthquake_dir ste_cos.flags matches 2.. run scoreboard players set #earthquake_dir ste_cos.flags 0
execute if score #earthquake_dir ste_cos.flags matches 0 as @e[tag=ste_cos.earthquake_shaken,type=!player] at @s run tp @s ~ ~0.04 ~
execute if score #earthquake_dir ste_cos.flags matches 1 as @e[tag=ste_cos.earthquake_shaken,type=!player] at @s run tp @s ~ ~-0.04 ~
