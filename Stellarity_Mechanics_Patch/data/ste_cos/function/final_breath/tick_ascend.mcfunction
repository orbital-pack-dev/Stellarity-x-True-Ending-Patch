# ste_cos:final_breath/tick_ascend
# подъем дракона

scoreboard players add #fb_ascend_tick ste_cos.timer 1

execute if score #fb_ascend_tick ste_cos.timer matches 1 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 67.4 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 2 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 67.8 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 3 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 68.2 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 4 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 68.6 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 5 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 69.0 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 6 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 69.4 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 7 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 69.8 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 8 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 70.2 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 9 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 70.6 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 10 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 71.0 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 11 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 71.4 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 12 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 71.8 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 13 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 72.2 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 14 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 72.6 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 15 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 73.0 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 16 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 73.4 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 17 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 73.8 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 18 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 74.2 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 19 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 74.6 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 20 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 75.0 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 21 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 75.4 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 22 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 75.8 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 23 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 76.2 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 24 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 76.6 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 25 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 77.0 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 26 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 77.4 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 27 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 77.8 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 28 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 78.2 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 29 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 78.6 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 30 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run tp @s 0 79.0 0 0 0

execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run data modify entity @s DragonPhase set value 5
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] run data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]

execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run particle dragon_breath ~ ~ ~ 0.5 0.5 0.5 0.05 8 force
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run particle reverse_portal ~ ~ ~ 1.0 0.5 1.0 0.05 15 force

execute if score #fb_ascend_tick ste_cos.timer matches 1 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 8 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 16 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 24 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 30 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap master @a ~ ~ ~ 64.0 1.0

# переход к зарядке
execute if score #fb_ascend_tick ste_cos.timer matches 30.. run scoreboard players set #final_breath_state ste_cos.flags 3
execute if score #fb_ascend_tick ste_cos.timer matches 30.. run scoreboard players set #final_breath_timer ste_cos.timer 0
execute if score #fb_ascend_tick ste_cos.timer matches 30.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run tp @s 0 79 0 0 0
execute if score #fb_ascend_tick ste_cos.timer matches 30.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run data modify entity @s DragonPhase set value 10
execute if score #fb_ascend_tick ste_cos.timer matches 30.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run data modify entity @s Motion set value [0.0d, 0.0d, 0.0d]
execute if score #fb_ascend_tick ste_cos.timer matches 30.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run tag @s add ste_cos.final_breath_active
execute if score #fb_ascend_tick ste_cos.timer matches 30.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run tag @s remove ste_cos.final_breath_ascending
