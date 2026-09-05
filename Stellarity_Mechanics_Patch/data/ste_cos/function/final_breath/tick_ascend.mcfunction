# ste_cos:final_breath/tick_ascend
# плавный подъем дракона от портала (~65) к высоте 90 (БЕЗ мгновенного ТП)

scoreboard players add #fb_ascend_tick ste_cos.timer 1

execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run particle dragon_breath ~ ~ ~ 0.5 0.5 0.5 0.05 8 force
execute as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run particle reverse_portal ~ ~ ~ 1.0 0.5 1.0 0.05 15 force

execute if score #fb_ascend_tick ste_cos.timer matches 1 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 8 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 16 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 24 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0
execute if score #fb_ascend_tick ste_cos.timer matches 30 as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending,limit=1] at @s run playsound entity.ender_dragon.flap hostile @a[distance=..16] ~ ~ ~ 1.0 1.0

# достижение высоты ~90 (32 тика * 0.8 = 25.6 блоков: 65 + 25.6 = ~90)
execute if score #fb_ascend_tick ste_cos.timer matches 32.. run scoreboard players set #final_breath_state ste_cos.flags 3
execute if score #fb_ascend_tick ste_cos.timer matches 32.. run scoreboard players set #final_breath_timer ste_cos.timer 0
execute if score #fb_ascend_tick ste_cos.timer matches 32.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run tag @s add ste_cos.final_breath_active
execute if score #fb_ascend_tick ste_cos.timer matches 32.. as @e[type=ender_dragon,tag=ste_cos.final_breath_ascending] run tag @s remove ste_cos.final_breath_ascending
