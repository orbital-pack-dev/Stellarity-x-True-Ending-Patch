# ste_cos:fresh_visual/earthquake_tick
# дрожь земли

# теги сущностей острова
execute in minecraft:the_end positioned 0 65 0 as @e[distance=..250,type=!player,type=!end_crystal,type=!marker,type=!block_display,type=!text_display,type=!item_display,type=!interaction,type=!area_effect_cloud,type=!ender_dragon,type=!phantom,type=!armor_stand,tag=!smithed.strict,tag=!stellarity.marker,tag=!ste_cos.visual_marker,tag=!ste_cos.clone_exit_carrier,tag=!ste_cos.earthquake_shaken] run tag @s add ste_cos.earthquake_shaken

# тряска экрана игроков
execute in minecraft:the_end positioned 0 65 0 as @a[distance=..250] at @s run function stellarity:entity/dragon/spawn/screenshake/tick_up

# вибрация мобов и предметов
scoreboard players add #earthquake_dir ste_cos.flags 1
execute if score #earthquake_dir ste_cos.flags matches 2.. run scoreboard players set #earthquake_dir ste_cos.flags 0
execute if score #earthquake_dir ste_cos.flags matches 0 as @e[tag=ste_cos.earthquake_shaken] at @s run tp @s ~0.08 ~ ~
execute if score #earthquake_dir ste_cos.flags matches 1 as @e[tag=ste_cos.earthquake_shaken] at @s run tp @s ~-0.08 ~ ~

# частицы дрожи земли
execute as @e[tag=ste_cos.earthquake_shaken] at @s if predicate true_ending:chance/10_percent run particle dust{color:[0.75,0.2,0.95],scale:0.7} ~ ~0.05 ~ 0.2 0.02 0.2 0 1 force
