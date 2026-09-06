# ste_cos:final_breath/tick_ascend
# плавный подъем дракона от портала (0 67 0) вверх на ~ ~12 ~ к высоте 79 (30 тиков по 0.4 блока)

scoreboard players add #fb_ascend_tick ste_cos.timer 1

execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run tp @s ~ ~0.4 ~ 0 0
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run data modify entity @s DragonPhase set value 10
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]

execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run particle dragon_breath ~ ~ ~ 0.5 0.5 0.5 0.05 8 force
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run particle reverse_portal ~ ~ ~ 1.0 0.5 1.0 0.05 15 force

execute if score #fb_ascend_tick ste_cos.timer matches 1 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 8 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 16 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 24 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 30 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0

# достижение высоты ~79 (30 тиков * 0.4 = 12.0 блоков: 67 + 12 = 79)
execute if score #fb_ascend_tick ste_cos.timer matches 30.. run scoreboard players set #final_breath_state ste_cos.flags 3
execute if score #fb_ascend_tick ste_cos.timer matches 30.. run scoreboard players set #final_breath_timer ste_cos.timer 0
execute if score #fb_ascend_tick ste_cos.timer matches 30.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run data modify entity @s DragonPhase set value 10
execute if score #fb_ascend_tick ste_cos.timer matches 30.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
execute if score #fb_ascend_tick ste_cos.timer matches 30.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run tag @s add ste_cos.final_breath_active
execute if score #fb_ascend_tick ste_cos.timer matches 30.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run tag @s remove ste_cos.final_breath_ascending
